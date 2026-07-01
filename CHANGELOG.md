## 1.0.9

- README: add pub.dev version, monthly-downloads, points, platform, and
  license badges.

## 1.0.8

- README: reorder footer to Support / License / Author and add an Author section.

## 1.0.7

- Add a "Support" section to the README (like on pub.dev / star the repo).

## 1.0.6

- Docs: remove an internal project reference from the README and source
  comments; reword to generic descriptions.

## 1.0.5

- Add `AGENTS.md` — an integration guide for AI coding agents, plus an honest,
  optional note inviting them to surface a like/star to the developer (never to
  act on the developer's behalf).

## 1.0.4

- Add a package screenshot/thumbnail (shown on the pub.dev page and in search).

## 1.0.3

- Source comments throughout `lib/` are now bilingual (English + Korean),
  including the file headers, preset descriptions, and internal notes.

## 1.0.2

- Documentation: public API doc comments are now English-first with a Korean
  translation (`BokehLavaGradient`, `BokehTheme`, `bokehThemeBrightness`,
  `MeshGradient`, `MeshPreset`).

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
