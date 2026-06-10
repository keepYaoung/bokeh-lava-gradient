# 🟠 bokeh-lava-gradient

Animated **bokeh / lava gradient backgrounds** for Flutter — soft colored blobs
drifting under a Gaussian blur, plus a path-faithful **mesh gradient** that
cross-fades between frames. Pure Flutter, **zero dependencies**.

Built originally for the Soonr rebrand (warm orange palette), but every color,
size and motion knob is a parameter.

## ▶️ Live simulation

**https://self-made-orange.github.io/bokeh-lava-gradient/**

An interactive build of the demo app. Toggle between the **four themed
presets** — `Light 1`, `Light 2`, `Dark 1`, `Dark 2` — and watch the palette
swap live while the blobs keep drifting.

> First load may take a few seconds (Flutter web bootstrap). Resize the window
> to see the gradient stays full-bleed at any aspect ratio.

## 🎨 Presets (2 light + 2 dark)

```dart
BokehLavaGradient.preset(BokehTheme.dark1, child: ...);
```

| Preset | Look |
|--------|------|
| `light1` | bright cream · soft pastel peach/apricot |
| `light2` | warm beige · muted orange & rose |
| `dark1`  | deep burnt orange · glowing amber |
| `dark2`  | near-black · strong orange glow |

`bokehThemeBrightness(theme)` returns the preset's `Brightness` so you can pick
readable text/icon colors for content on top.

## ✨ What it does

| Mode | How it works |
|------|--------------|
| **`BokehLavaGradient`** | N soft radial-gradient blobs (varied size & color) bounce slowly around the canvas; the whole layer gets a Gaussian blur → bokeh. Overlapping blobs blend via alpha. |
| **`MeshGradient`** | Renders real Figma vector paths + per-shape Gaussian blur (`MaskFilter.blur`), faithful to the design. Swap `preset` to cross-fade between frames; an optional ambient drift keeps it alive. |

Both are resolution-independent (no image assets) and fill their parent.

## 🚀 Usage

```dart
import 'package:bokeh_lava_gradient/bokeh_lava_gradient.dart';

// Drop it behind your content
Stack(
  fit: StackFit.expand,
  children: [
    const BokehLavaGradient(),
    YourContent(),
  ],
);
```

Tune it:

```dart
BokehLavaGradient(
  baseColor: const Color(0xFFC65318),   // fill behind the blobs
  colors: const [ /* your palette */ ], // blob colors (cycled)
  blobCount: 12,
  speed: 0.6,                           // drift speed
  blurStrength: 0.05,                   // bokeh strength (× shortest side)
  blobOpacity: 0.85,                    // < 1 → blobs blend their colors
  minBlobRadius: 0.30,                  // size range (× shortest side)
  maxBlobRadius: 1.0,
  child: YourContent(),
);
```

Mesh gradient (cross-fading frames):

```dart
import 'package:bokeh_lava_gradient/mesh_gradient.dart';

MeshGradient(
  preset: dark ? MeshPreset.f03 : MeshPreset.f01, // f01..f04
  crossDuration: const Duration(milliseconds: 1100),
  animateAmbient: true,
  child: YourContent(),
);
```

## 🧪 Run the demo locally

```bash
flutter pub get
flutter run -d chrome        # or any connected device
```

## 📁 Layout

```
lib/
  bokeh_lava_gradient.dart   # BokehLavaGradient widget
  mesh_gradient.dart         # MeshGradient + MeshPreset (f_01–f_04)
  main.dart                  # demo app (the live simulation)
docs/                        # built web demo (served by GitHub Pages)
```

## 📝 License

MIT. The metaball / lava-blob motion was adapted from
[lava_lamp_effect](https://github.com/yashas-hm/lava-lamp-effect) (MIT, © yashas-hm).
See [LICENSE](LICENSE).
