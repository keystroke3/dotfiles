import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Services.UI
import "." as Local

Item {
  id: root

  property var pluginApi: null

  // IP Monitor Service
  Item {
    id: service
    
    property var ipData: null
    property string currentIp: "n/a"
    property string fetchState: "idle" // idle, loading, success, error
    property int lastFetchTime: 0
    
    // Increment this to trigger refresh in all listening widgets (for IPC)
    property int refreshTrigger: 0
    
    // Read global settings
    readonly property var cfg: root.pluginApi?.pluginSettings || ({})
    readonly property var defaults: root.pluginApi?.manifest?.metadata?.defaultSettings || ({})
    readonly property int refreshInterval: cfg.refreshInterval ?? defaults.refreshInterval ?? 300
    
    // Process for fetching IP info
    property Process ipFetchProcess: Process {
      running: false
      command: ["curl", "-s", "-m", "10", "https://ipinfo.io"]
      stdout: StdioCollector {
        id: stdoutCollector
      }
      stderr: StdioCollector {
        id: stderrCollector
      }
      
      onStarted: {
        service.fetchState = "loading";
        Logger.d("IpMonitor", "Service fetching IP info...");
      }
      
      onExited: function(exitCode, exitStatus) {
        var output = stdoutCollector.text;
        Logger.d("IpMonitor", "Service process exited:", exitCode, "length:", output.length);
        
        if (exitCode === 0 && output.length > 0) {
          try {
            var data = JSON.parse(output);
            if (data.ip) {
              service.ipData = data;
              service.currentIp = data.ip;
              service.fetchState = "success";
              service.lastFetchTime = Date.now();
              Logger.d("IpMonitor", "Service IP fetched successfully:", service.currentIp);
            } else {
              throw new Error("No IP field in response");
            }
          } catch (e) {
            Logger.e("IpMonitor", "Service parse error:", e.message);
            service.currentIp = "n/a";
            service.ipData = null;
            service.fetchState = "error";
          }
        } else {
          Logger.e("IpMonitor", "Service curl failed:", exitCode);
          service.currentIp = "n/a";
          service.ipData = null;
          service.fetchState = "error";
        }
      }
    }
    
    property Timer autoRefreshTimer: Timer {
      interval: service.refreshInterval * 1000
      running: interval > 0
      repeat: true
      onTriggered: service.fetchIp()
    }
    
    Component.onCompleted: {
      Logger.i("IpMonitor", "Service initialized, frist time fetching IP.");
      // Auto-fetch on startup
      Qt.callLater(() => fetchIp());
    }
    
    function fetchIp() {
      if (!service.ipFetchProcess) {
        Logger.e("IpMonitor", "Service ipFetchProcess is null!");
        return;
      }
      if (!service.ipFetchProcess.running) {
        Logger.d("IpMonitor", "Service starting ipFetchProcess");
        service.ipFetchProcess.running = true;
      } else {
        Logger.d("IpMonitor", "Service fetch already in progress");
      }
    }
    
    function triggerRefresh() {
      Logger.d("IpMonitor", "Service triggerRefresh() called");
      refreshTrigger++;
      fetchIp();
    }
  }

  // Expose service for access via pluginApi.root.ipMonitorService
  property alias ipMonitorService: service

  Component.onCompleted: {}

  // IPC handlers
  IpcHandler {
    target: "plugin:ip-monitor"
    
    function refreshIp() {
      Logger.i("IpMonitor", "IPC refreshIp() called");
      service.triggerRefresh();
      ToastService.showNotice("Refreshing IP info...");
    }
    
    function toggle() {
      if (pluginApi) {
        pluginApi.withCurrentScreen(screen => {
          pluginApi.openPanel(screen);
        });
      }
    }
  }
}

