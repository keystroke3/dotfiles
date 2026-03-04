import QtQuick
import Quickshell
import qs.Commons
import qs.Services.System
import qs.Services.UI
import Quickshell.Io

Item {
  id: root

  property var pluginApi: null

  IpcHandler {
    target: "plugin:timer"
    
    function toggle() {
      if (pluginApi) {
        pluginApi.withCurrentScreen(screen => {
          pluginApi.togglePanel(screen);
        });
      }
    }

    function start(duration_str: string) {
      if (duration_str && duration_str === "stopwatch") {
        root.timerReset();
        root.timerStopwatchMode = true;
      } else if (duration_str && duration_str !== "") {
        const seconds = root.parseDuration(duration_str);
        if (seconds > 0) {
          root.timerReset();
          root.timerRemainingSeconds = seconds;
          root.timerStopwatchMode = false;
        }
      }
      root.timerStart();
    }

    function pause() {
      root.timerPause();
    }

    function reset() {
      root.timerReset();
    }
  }

  // Timer state
  property bool timerRunning: false
  property bool timerStopwatchMode: false
  property int timerRemainingSeconds: 0
  property int timerTotalSeconds: 0
  property int timerElapsedSeconds: 0
  property bool timerSoundPlaying: false
  property int timerStartTimestamp: 0
  property int timerPausedAt: 0

  // Current timestamp
  property int timestamp: Math.floor(Date.now() / 1000)

  // Main timer loop
  Timer {
    id: updateTimer
    interval: 1000
    repeat: true
    running: true
    triggeredOnStart: false
    onTriggered: {
      var now = new Date();
      root.timestamp = Math.floor(now.getTime() / 1000);

      // Update timer if running
      if (root.timerRunning && root.timerStartTimestamp > 0) {
        const elapsedSinceStart = root.timestamp - root.timerStartTimestamp;

        if (root.timerStopwatchMode) {
          root.timerElapsedSeconds = root.timerPausedAt + elapsedSinceStart;
        } else {
          root.timerRemainingSeconds = root.timerTotalSeconds - elapsedSinceStart;
          if (root.timerRemainingSeconds <= 0) {
            root.timerOnFinished();
          }
        }
      }

      // Sync to next second
      var msIntoSecond = now.getMilliseconds();
      if (msIntoSecond > 100) {
        updateTimer.interval = 1000 - msIntoSecond + 10;
        updateTimer.restart();
      } else {
        updateTimer.interval = 1000;
      }
    }
  }

  Component.onCompleted: {
    // Sync start
    var now = new Date();
    var msUntilNextSecond = 1000 - now.getMilliseconds();
    updateTimer.interval = msUntilNextSecond + 10;
    updateTimer.restart();
  }

  // Logic
  function timerStart() {
    if (root.timerStopwatchMode) {
      root.timerRunning = true;
      root.timerStartTimestamp = root.timestamp;
      root.timerPausedAt = root.timerElapsedSeconds;
    } else {
      if (root.timerRemainingSeconds <= 0) {
        return;
      }
      root.timerRunning = true;
      root.timerTotalSeconds = root.timerRemainingSeconds;
      root.timerStartTimestamp = root.timestamp;
      root.timerPausedAt = 0;
    }
  }

  function timerPause() {
    if (root.timerRunning) {
      if (root.timerStopwatchMode) {
        root.timerPausedAt = root.timerElapsedSeconds;
      } else {
        const currentTimestamp = Math.floor(Date.now() / 1000);
        const elapsedSinceStart = currentTimestamp - root.timerStartTimestamp;
        const currentRemaining = root.timerTotalSeconds - elapsedSinceStart;
        root.timerPausedAt = Math.max(0, currentRemaining);
        root.timerRemainingSeconds = root.timerPausedAt;
      }
    }
    root.timerRunning = false;
    root.timerStartTimestamp = 0;
    SoundService.stopSound("alarm-beep.wav");
    root.timerSoundPlaying = false;
  }

  function timerReset() {
    root.timerRunning = false;
    root.timerStartTimestamp = 0;
    if (root.timerStopwatchMode) {
      root.timerElapsedSeconds = 0;
      root.timerPausedAt = 0;
    } else {
      root.timerRemainingSeconds = 0;
      root.timerTotalSeconds = 0;
      root.timerPausedAt = 0;
    }
    SoundService.stopSound("alarm-beep.wav");
    root.timerSoundPlaying = false;
  }

  function parseDuration(duration_str) {
    if (!duration_str) return 0;
    
    // Default to minutes if just a number
    if (/^\d+$/.test(duration_str)) {
      return parseInt(duration_str) * 60;
    }

    var totalSeconds = 0;
    var regex = /(\d+)([hms])/g;
    var match;
    
    while ((match = regex.exec(duration_str)) !== null) {
      var value = parseInt(match[1]);
      var unit = match[2];
      
      if (unit === 'h') totalSeconds += value * 3600;
      else if (unit === 'm') totalSeconds += value * 60;
      else if (unit === 's') totalSeconds += value;
    }
    
    return totalSeconds;
  }

  function timerOnFinished() {
    root.timerRunning = false;
    root.timerRemainingSeconds = 0;
    root.timerSoundPlaying = true;
    SoundService.playSound("alarm-beep.wav", {
      repeat: true,
      volume: 0.3
    });
    ToastService.showNotice(
      pluginApi?.tr("toast.title") || "Timer",
      pluginApi?.tr("toast.finished") || "Timer finished!",
      "hourglass"
    );
  }
}
