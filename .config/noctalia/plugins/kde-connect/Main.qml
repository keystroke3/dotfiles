import QtQuick
import Quickshell.Io
import qs.Services.UI
import qs.Commons
import "./Services"

Item {
  property var pluginApi: null

  onPluginApiChanged: {
    KDEConnect.setMainDevice(pluginApi?.pluginSettings?.mainDeviceId || "")
  }

  IpcHandler {
    target: "plugin:kde-connect"
    function toggle() {
      if (pluginApi) {
        pluginApi.withCurrentScreen(screen => {
          pluginApi.openPanel(screen);
        });
      }
    }
  }
}