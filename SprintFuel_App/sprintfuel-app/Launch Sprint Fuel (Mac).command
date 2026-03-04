#!/bin/bash
# Sprint Fuel Launcher for macOS

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_FILE="$SCRIPT_DIR/SprintFuel_Tracker.html"
APP_URL="file://$APP_FILE"

# Try Chrome first
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -f "$CHROME" ]; then
  echo "Launching Sprint Fuel in Chrome App Mode..."
  "$CHROME" \
    --app="$APP_URL" \
    --window-size=1100,820 \
    --disable-extensions \
    --no-first-run \
    --disable-default-apps \
    --user-data-dir="$SCRIPT_DIR/chrome-data" \
    &
  exit 0
fi

# Try Edge
EDGE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
if [ -f "$EDGE" ]; then
  echo "Launching Sprint Fuel in Edge App Mode..."
  "$EDGE" \
    --app="$APP_URL" \
    --window-size=1100,820 \
    --user-data-dir="$SCRIPT_DIR/edge-data" \
    &
  exit 0
fi

# Fallback: open in default browser
echo "Opening in default browser..."
open "$APP_FILE"
