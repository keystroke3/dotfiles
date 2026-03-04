import QtQuick
import Quickshell
import qs.Commons

Singleton {
  id: root

  property var pluginApi: null

  Component.onCompleted: {
    if (pluginApi) {
      Logger.i("WorldClock", "Main initialized for World Clock plugin");
    }
  }
}
