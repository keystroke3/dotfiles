import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

// Settings Component - Same UI as Panel but adapted for settings page
ColumnLayout {
  id: root
  spacing: Style.marginM

  property var pluginApi: null

  // Configuration
  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})

  property var timezones: cfg.timezones ?? defaults.timezones ?? []
  property int rotationInterval: (cfg.rotationInterval ?? defaults.rotationInterval ?? 5000) / 1000
  property string timeFormat: cfg.timeFormat ?? defaults.timeFormat ?? "HH:mm"

  Component.onCompleted: {
    if (pluginApi) {
      Logger.i("WorldClock", "Settings initialized");
    }
  }

  // This function is called by the dialog to save settings
  function saveSettings() {
    if (!pluginApi) {
      Logger.e("WorldClock", "Cannot save settings: pluginApi is null");
      return;
    }

    // Update the plugin settings object
    pluginApi.pluginSettings.timezones = timezones;
    pluginApi.pluginSettings.rotationInterval = rotationInterval * 1000;
    pluginApi.pluginSettings.timeFormat = timeFormat;

    // Save to disk
    pluginApi.saveSettings();

    Logger.i("WorldClock", "Settings saved successfully");
  }

  function updateTimezones(newTimezones) {
    timezones = newTimezones;
    if (pluginApi) {
      pluginApi.pluginSettings.timezones = newTimezones;
      pluginApi.saveSettings();
    }
  }

  // Popular timezones list
  readonly property var availableTimezones: [
    { name: pluginApi?.tr("city.new-york"), timezone: "America/New_York", region: "Americas" },
    { name: pluginApi?.tr("city.los-angeles"), timezone: "America/Los_Angeles", region: "Americas" },
    { name: pluginApi?.tr("city.chicago"), timezone: "America/Chicago", region: "Americas" },
    { name: pluginApi?.tr("city.sao-paulo"), timezone: "America/Sao_Paulo", region: "Americas" },
    { name: pluginApi?.tr("city.mexico-city"), timezone: "America/Mexico_City", region: "Americas" },
    { name: pluginApi?.tr("city.buenos-aires"), timezone: "America/Argentina/Buenos_Aires", region: "Americas" },
    { name: pluginApi?.tr("city.toronto"), timezone: "America/Toronto", region: "Americas" },
    { name: pluginApi?.tr("city.vancouver"), timezone: "America/Vancouver", region: "Americas" },
    { name: pluginApi?.tr("city.lima"), timezone: "America/Lima", region: "Americas" },
    { name: pluginApi?.tr("city.bogota"), timezone: "America/Bogota", region: "Americas" },
    
    { name: pluginApi?.tr("city.london"), timezone: "Europe/London", region: "Europe" },
    { name: pluginApi?.tr("city.paris"), timezone: "Europe/Paris", region: "Europe" },
    { name: pluginApi?.tr("city.berlin"), timezone: "Europe/Berlin", region: "Europe" },
    { name: pluginApi?.tr("city.madrid"), timezone: "Europe/Madrid", region: "Europe" },
    { name: pluginApi?.tr("city.rome"), timezone: "Europe/Rome", region: "Europe" },
    { name: pluginApi?.tr("city.moscow"), timezone: "Europe/Moscow", region: "Europe" },
    { name: pluginApi?.tr("city.amsterdam"), timezone: "Europe/Amsterdam", region: "Europe" },
    { name: pluginApi?.tr("city.stockholm"), timezone: "Europe/Stockholm", region: "Europe" },
    { name: pluginApi?.tr("city.istanbul"), timezone: "Europe/Istanbul", region: "Europe" },
    { name: pluginApi?.tr("city.athens"), timezone: "Europe/Athens", region: "Europe" },
    
    { name: pluginApi?.tr("city.tokyo"), timezone: "Asia/Tokyo", region: "Asia" },
    { name: pluginApi?.tr("city.shanghai"), timezone: "Asia/Shanghai", region: "Asia" },
    { name: pluginApi?.tr("city.dubai"), timezone: "Asia/Dubai", region: "Asia" },
    { name: pluginApi?.tr("city.singapore"), timezone: "Asia/Singapore", region: "Asia" },
    { name: pluginApi?.tr("city.hong-kong"), timezone: "Asia/Hong_Kong", region: "Asia" },
    { name: pluginApi?.tr("city.mumbai"), timezone: "Asia/Kolkata", region: "Asia" },
    { name: pluginApi?.tr("city.bangkok"), timezone: "Asia/Bangkok", region: "Asia" },
    { name: pluginApi?.tr("city.seoul"), timezone: "Asia/Seoul", region: "Asia" },
    { name: pluginApi?.tr("city.jakarta"), timezone: "Asia/Jakarta", region: "Asia" },
    { name: pluginApi?.tr("city.manila"), timezone: "Asia/Manila", region: "Asia" },
    
    { name: pluginApi?.tr("city.sydney"), timezone: "Australia/Sydney", region: "Oceania" },
    { name: pluginApi?.tr("city.melbourne"), timezone: "Australia/Melbourne", region: "Oceania" },
    { name: pluginApi?.tr("city.auckland"), timezone: "Pacific/Auckland", region: "Oceania" },
    { name: pluginApi?.tr("city.brisbane"), timezone: "Australia/Brisbane", region: "Oceania" },
    
    { name: pluginApi?.tr("city.cairo"), timezone: "Africa/Cairo", region: "Africa" },
    { name: pluginApi?.tr("city.johannesburg"), timezone: "Africa/Johannesburg", region: "Africa" },
    { name: pluginApi?.tr("city.lagos"), timezone: "Africa/Lagos", region: "Africa" },
    { name: pluginApi?.tr("city.nairobi"), timezone: "Africa/Nairobi", region: "Africa" }
  ]

  // Header
  RowLayout {
    Layout.fillWidth: true
    spacing: Style.marginM

    NIcon {
      icon: "history"
      pointSize: Style.fontSizeXL
      color: Color.mPrimary
    }

    NText {
      text: pluginApi?.tr("world-clock.title")
      pointSize: Style.fontSizeL
      font.weight: Font.Medium
      color: Color.mOnSurface
    }

    Item { Layout.fillWidth: true }
  }

  Rectangle {
    Layout.fillWidth: true
    Layout.preferredHeight: 1
    color: Color.mOutline
  }

  // Display Settings
  ColumnLayout {
    Layout.fillWidth: true
    spacing: Style.marginM

    NText {
      text: pluginApi?.tr("world-clock.display-settings")
      pointSize: Style.fontSizeM
      font.weight: Font.Medium
      color: Color.mOnSurface
    }

    // Rotation Interval
    RowLayout {
      Layout.fillWidth: true
      spacing: Style.marginM

      NText {
        text: pluginApi?.tr("world-clock.rotation-interval")
        pointSize: Style.fontSizeS
        color: Color.mOnSurfaceVariant
        Layout.fillWidth: true
      }

      NSpinBox {
        id: rotationSpinBox
        from: 1
        to: 60
        value: root.rotationInterval
        suffix: " s"
        onValueChanged: {
          root.rotationInterval = value;
          if (pluginApi) {
            pluginApi.pluginSettings.rotationInterval = value * 1000;
            pluginApi.saveSettings();
          }
        }
      }
    }

    // Time Format
    RowLayout {
      Layout.fillWidth: true
      spacing: Style.marginM

      NText {
        text: pluginApi?.tr("world-clock.time-format")
        pointSize: Style.fontSizeS
        color: Color.mOnSurfaceVariant
        Layout.fillWidth: true
      }

      NComboBox {
        id: timeFormatCombo
        model: [
          { "key": "HH:mm", "name": pluginApi?.tr("world-clock.format.24h") },
          { "key": "HH:mm:ss", "name": pluginApi?.tr("world-clock.format.24h-seconds") },
          { "key": "h:mm A", "name": pluginApi?.tr("world-clock.format.12h") },
          { "key": "h:mm:ss A", "name": pluginApi?.tr("world-clock.format.12h-seconds") }
        ]
        currentKey: root.timeFormat
        onSelected: key => {
          root.timeFormat = key;
          if (pluginApi) {
            pluginApi.pluginSettings.timeFormat = key;
            pluginApi.saveSettings();
          }
        }
      }
    }
  }

  Rectangle {
    Layout.fillWidth: true
    Layout.preferredHeight: 1
    color: Color.mOutline
  }

  // Timezones Section
  ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: Style.marginM

    RowLayout {
      Layout.fillWidth: true

      NText {
        text: pluginApi?.tr("world-clock.timezones")
        pointSize: Style.fontSizeM
        font.weight: Font.Medium
        color: Color.mOnSurface
      }

      Item { Layout.fillWidth: true }

      NButton {
        icon: "plus"
        enabled: root.timezones.length < 5
        onClicked: {
          let newTimezones = root.timezones.slice();
          // Add first available timezone from the list
          let firstTz = root.availableTimezones[0];
          newTimezones.push({
            name: firstTz.name,
            timezone: firstTz.timezone,
            enabled: true
          });
          root.timezones = newTimezones;
          if (pluginApi) {
            pluginApi.pluginSettings.timezones = newTimezones;
            pluginApi.saveSettings();
          }
        }
      }
    }

    // Timezone list
    ColumnLayout {
      Layout.fillWidth: true
      spacing: Style.marginS

      Repeater {
        model: root.timezones

        delegate: Rectangle {
          required property int index
          required property var modelData
          
          Layout.fillWidth: true
          Layout.preferredHeight: timezoneContent.implicitHeight + Style.marginS * 2
          color: modelData.enabled ? Color.mSurface : Color.mSurfaceVariant
          radius: Style.radiusM
          border.color: Color.mOutline
          border.width: 1

          RowLayout {
            id: timezoneContent
            anchors.fill: parent
            anchors.margins: Style.marginS
            spacing: Style.marginS

            NToggle {
              id: toggleItem
              Layout.alignment: Qt.AlignVCenter
              checked: modelData.enabled
              onToggled: checked => {
                var tzs = root.timezones.slice();
                tzs[index].enabled = checked;
                root.updateTimezones(tzs);
              }
            }

            NComboBox {
              id: comboItem
              Layout.fillWidth: true
              Layout.alignment: Qt.AlignVCenter
              
              property var comboModel: {
                var model = [];
                for (var i = 0; i < root.availableTimezones.length; i++) {
                  var tz = root.availableTimezones[i];
                  model.push({
                    "key": i.toString(),
                    "name": tz.name + " (" + tz.timezone + ")"
                  });
                }
                return model;
              }
              
              model: comboModel
              
              // Find current timezone in the list
              currentKey: {
                for (var i = 0; i < root.availableTimezones.length; i++) {
                  if (root.availableTimezones[i].timezone === modelData.timezone) {
                    return i.toString();
                  }
                }
                return "0";
              }
              
              onSelected: key => {
                var selectedIndex = parseInt(key);
                var selectedTz = root.availableTimezones[selectedIndex];
                
                var tzs = root.timezones.slice();
                tzs[index].name = selectedTz.name;
                tzs[index].timezone = selectedTz.timezone;
                root.updateTimezones(tzs);
              }
            }

            NIconButton {
              id: deleteButton
              Layout.alignment: Qt.AlignVCenter
              icon: "trash"
              onClicked: {
                var tzs = root.timezones.slice();
                tzs.splice(index, 1);
                root.updateTimezones(tzs);
              }
            }
          }
        }
      }
    }

    // Info text
    NText {
      Layout.fillWidth: true
      text: `${root.availableTimezones.length} ${pluginApi?.tr("world-clock.available-timezones") || "timezones available"}`
      pointSize: Style.fontSizeXS
      color: Color.mOnSurfaceVariant
    }
    
    // API info footer
    NText {
      Layout.fillWidth: true
      text: pluginApi?.tr("world-clock.api-info")
      pointSize: Style.fontSizeXS
      color: Color.mOnSurfaceVariant
      opacity: 0.7
      horizontalAlignment: Text.AlignHCenter
      Layout.topMargin: Style.marginS
    }
  }

  Item {
    Layout.fillHeight: true
  }
}
