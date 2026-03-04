# Fancy Audiovisualizer

A circular audio visualizer desktop widget for Noctalia Shell with shader-based rendering and multiple visualization modes.

## Features

- **Multiple Visualization Modes**: Bars, Wave, Rings, or combinations (Bars+Rings, Wave+Rings, All)
- **Shader-Based Rendering**: Smooth, GPU-accelerated visualization using custom fragment shaders
- **Theme Integration**: Automatically uses Noctalia theme colors, with optional custom color override
- **Configurable Appearance**: Adjust sensitivity, rotation speed, bar width, ring opacity, bloom intensity, and more
- **Idle Fade**: Optional fade-out when no audio is playing

## Installation

This plugin is part of the `noctalia-plugins` repository.

## Configuration

Access the plugin settings in Noctalia to configure the following options:

- **Visualization Mode**: Choose between Bars, Wave, Rings, Bars+Rings, Wave+Rings, or All
- **Wave Thickness**: Thickness of the wave visualization (when enabled)
- **Sensitivity**: Audio response sensitivity (0.5 - 3.0)
- **Rotation Speed**: Speed of visualization rotation (0.0 - 2.0)
- **Bar Width**: Width of audio bars (when enabled)
- **Ring Opacity**: Opacity of background rings (when enabled)
- **Inner Diameter**: Size of the inner empty area
- **Bloom Intensity**: Glow/bloom effect strength
- **Fade When Idle**: Fade out when no audio is playing
- **Custom Colors**: Override theme colors with custom primary and secondary colors

## Usage

Add the widget to your desktop via the Noctalia desktop widgets interface. The visualizer responds to system audio through CavaService.

## Requirements

- Noctalia 3.7.2 or later
- Cava audio visualizer (for audio data)
