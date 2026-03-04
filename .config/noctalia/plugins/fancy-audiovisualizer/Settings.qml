import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
  id: root

  property var pluginApi: null
  property var screen: null

  spacing: Style.marginM

  // Local state for editing
  property real valueSensitivity: pluginApi?.pluginSettings?.sensitivity ?? 1.5
  property real valueRotationSpeed: pluginApi?.pluginSettings?.rotationSpeed ?? 0.5
  property real valueBarWidth: pluginApi?.pluginSettings?.barWidth ?? 0.6
  property real valueRingOpacity: pluginApi?.pluginSettings?.ringOpacity ?? 0.8
  property real valueBloomIntensity: pluginApi?.pluginSettings?.bloomIntensity ?? 0.5
  property int valueVisualizationMode: pluginApi?.pluginSettings?.visualizationMode ?? 3
  property real valueWaveThickness: pluginApi?.pluginSettings?.waveThickness ?? 1.0
  property real valueInnerDiameter: pluginApi?.pluginSettings?.innerDiameter ?? 0.7
  property bool valueFadeWhenIdle: pluginApi?.pluginSettings?.fadeWhenIdle ?? true
  property bool valueUseCustomColors: pluginApi?.pluginSettings?.useCustomColors ?? false
  property color valueCustomPrimaryColor: pluginApi?.pluginSettings?.customPrimaryColor ?? "#6750A4"
  property color valueCustomSecondaryColor: pluginApi?.pluginSettings?.customSecondaryColor ?? "#625B71"

  // Mode helpers
  readonly property bool modeHasBars: valueVisualizationMode === 0 || valueVisualizationMode === 3 || valueVisualizationMode === 5
  readonly property bool modeHasWave: valueVisualizationMode === 1 || valueVisualizationMode === 4 || valueVisualizationMode === 5
  readonly property bool modeHasRings: valueVisualizationMode >= 2

  NHeader {
    label: pluginApi?.tr("settings.title") ?? "Visualizer Settings"
    description: pluginApi?.tr("settings.description") ?? "Configure the audio visualizer appearance"
  }

  // Visualization mode selector
  NComboBox {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.visualizationMode") ?? "Visualization Mode"
    description: pluginApi?.tr("settings.visualizationMode-description") ?? "Choose visualization style"
    model: [
      {"key": "0", "name": pluginApi?.tr("settings.mode.bars") ?? "Bars"},
      {"key": "1", "name": pluginApi?.tr("settings.mode.wave") ?? "Wave"},
      {"key": "2", "name": pluginApi?.tr("settings.mode.rings") ?? "Rings"},
      {"key": "3", "name": pluginApi?.tr("settings.mode.barsRings") ?? "Bars + Rings"},
      {"key": "4", "name": pluginApi?.tr("settings.mode.waveRings") ?? "Wave + Rings"},
      {"key": "5", "name": pluginApi?.tr("settings.mode.all") ?? "All"}
    ]
    currentKey: String(root.valueVisualizationMode)
    onSelected: key => root.valueVisualizationMode = parseInt(key)
  }

  // Wave thickness slider (shown when mode includes wave)
  NValueSlider {
    Layout.fillWidth: true
    visible: root.modeHasWave
    label: pluginApi?.tr("settings.waveThickness") ?? "Wave Thickness"
    value: root.valueWaveThickness
    from: 0.3
    to: 2.0
    stepSize: 0.1
    onMoved: value => root.valueWaveThickness = value
  }

  // Sensitivity slider
  NValueSlider {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.sensitivity") ?? "Sensitivity"
    value: root.valueSensitivity
    from: 0.5
    to: 3.0
    stepSize: 0.1
    onMoved: value => root.valueSensitivity = value
  }

  // Rotation speed slider
  NValueSlider {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.rotationSpeed") ?? "Rotation Speed"
    value: root.valueRotationSpeed
    from: 0.0
    to: 2.0
    stepSize: 0.1
    onMoved: value => root.valueRotationSpeed = value
  }

  // Bar width slider (shown when mode includes bars)
  NValueSlider {
    Layout.fillWidth: true
    visible: root.modeHasBars
    label: pluginApi?.tr("settings.barWidth") ?? "Bar Width"
    value: root.valueBarWidth
    from: 0.2
    to: 1.0
    stepSize: 0.1
    onMoved: value => root.valueBarWidth = value
  }

  // Ring opacity slider (shown when mode includes rings)
  NValueSlider {
    Layout.fillWidth: true
    visible: root.modeHasRings
    label: pluginApi?.tr("settings.ringOpacity") ?? "Ring Opacity"
    value: root.valueRingOpacity
    from: 0.0
    to: 1.0
    stepSize: 0.1
    onMoved: value => root.valueRingOpacity = value
  }

  // Base diameter slider
  NValueSlider {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.innerDiameter") ?? "Inner Diameter"
    value: root.valueInnerDiameter
    from: 0
    to: 1
    stepSize: 0.05
    onMoved: value => root.valueInnerDiameter = value
  }

  // Bloom intensity slider
  NValueSlider {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.bloomIntensity") ?? "Bloom Intensity"
    value: root.valueBloomIntensity
    from: 0.0
    to: 1.0
    stepSize: 0.05
    onMoved: value => root.valueBloomIntensity = value
  }

  // Fade when idle toggle
  NToggle {
    label: pluginApi?.tr("settings.fadeWhenIdle") ?? "Fade When Idle"
    description: pluginApi?.tr("settings.fadeWhenIdle-description") ?? "Fade out visualizer when no audio is playing"
    checked: root.valueFadeWhenIdle
    onToggled: checked => root.valueFadeWhenIdle = checked
  }

  // Use custom colors toggle
  NToggle {
    label: pluginApi?.tr("settings.useCustomColors") ?? "Use Custom Colors"
    description: pluginApi?.tr("settings.useCustomColors-description") ?? "Override theme colors with custom colors"
    checked: root.valueUseCustomColors
    onToggled: checked => root.valueUseCustomColors = checked
  }

  // Custom primary color picker
  RowLayout {
    Layout.fillWidth: true
    visible: root.valueUseCustomColors
    spacing: Style.marginM

    NText {
      text: pluginApi?.tr("settings.customPrimaryColor") ?? "Primary Color"
      Layout.fillWidth: true
    }

    NColorPicker {
      screen: Screen
      selectedColor: root.valueCustomPrimaryColor
      onColorSelected: color => root.valueCustomPrimaryColor = color
    }
  }

  // Custom secondary color picker
  RowLayout {
    Layout.fillWidth: true
    visible: root.valueUseCustomColors
    spacing: Style.marginM

    NText {
      text: pluginApi?.tr("settings.customSecondaryColor") ?? "Secondary Color"
      Layout.fillWidth: true
    }

    NColorPicker {
      screen: Screen
      selectedColor: root.valueCustomSecondaryColor
      onColorSelected: color => root.valueCustomSecondaryColor = color
    }
  }

  // Called when user clicks Apply/Save
  function saveSettings() {
    if (!pluginApi)
      return;

    pluginApi.pluginSettings.sensitivity = root.valueSensitivity;
    pluginApi.pluginSettings.rotationSpeed = root.valueRotationSpeed;
    pluginApi.pluginSettings.barWidth = root.valueBarWidth;
    pluginApi.pluginSettings.ringOpacity = root.valueRingOpacity;
    pluginApi.pluginSettings.bloomIntensity = root.valueBloomIntensity;
    pluginApi.pluginSettings.visualizationMode = root.valueVisualizationMode;
    pluginApi.pluginSettings.waveThickness = root.valueWaveThickness;
    pluginApi.pluginSettings.innerDiameter = root.valueInnerDiameter;
    pluginApi.pluginSettings.fadeWhenIdle = root.valueFadeWhenIdle;
    pluginApi.pluginSettings.useCustomColors = root.valueUseCustomColors;
    pluginApi.pluginSettings.customPrimaryColor = root.valueCustomPrimaryColor.toString();
    pluginApi.pluginSettings.customSecondaryColor = root.valueCustomSecondaryColor.toString();

    pluginApi.saveSettings();
  }
}
