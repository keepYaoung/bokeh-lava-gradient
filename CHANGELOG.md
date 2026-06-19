## 1.0.1

- Add an animated demo GIF to the README.

## 1.0.0

Initial release.

- `BokehLavaGradient` — animated bokeh / lava gradient background widget.
  Soft colored blobs drift under a Gaussian blur; every color, size and motion
  knob is a parameter.
- 7 built-in presets (`og`, `light1`–`light3`, `dark1`–`dark3`) via the
  `BokehLavaGradient.preset(theme)` factory, plus `bokehThemeBrightness`.
- `MeshGradient` — path-faithful mesh gradient widget that cross-fades between
  frame presets (`MeshPreset`).
- Performance: low-resolution blur buffer, fps throttling, and auto-pause when
  the widget is offscreen or the app is backgrounded.
- Pure Flutter, zero third-party dependencies.
