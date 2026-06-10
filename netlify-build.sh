#!/usr/bin/env bash
# Installs Flutter (cached across builds when possible) and builds the web demo.
# Output goes to build/web, which netlify.toml publishes.
set -euo pipefail

FLUTTER_DIR="$HOME/flutter"

if [ ! -x "$FLUTTER_DIR/bin/flutter" ]; then
  echo "→ cloning Flutter (stable, shallow)…"
  git clone --depth 1 -b stable https://github.com/flutter/flutter.git "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

flutter --version
flutter config --enable-web
flutter pub get
# Served at the site root on Netlify/Vercel → default base-href "/"
flutter build web --release
