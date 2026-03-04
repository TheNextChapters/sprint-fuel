@echo off
title Sprint Fuel

pushd "%~dp0"

set "HTML=%~dp0index.html"

if not exist "%HTML%" (
  echo ERROR: Cannot find index.html next to this launcher.
  echo Make sure this .bat file is in the same folder as index.html
  pause
  goto :end
)

:: Build file:/// URL with forward slashes
set "FWDPATH=%HTML:\=/%"
set "APP_URL=file:///%FWDPATH%"

:: Remove double slashes that can appear if path starts with //
set "APP_URL=%APP_URL:////=///%"

:: ── CHROME ──────────────────────────────────────────────────────
set "CHROME="
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe"       set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe"       set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"  set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

if defined CHROME (
  echo Launching Sprint Fuel in Chrome App Mode...
  start "" "%CHROME%" --app="%APP_URL%" --window-size=1150,850 --window-position=80,40 --no-first-run --disable-extensions --disable-default-apps --user-data-dir="%~dp0chrome-data"
  goto :end
)

:: ── EDGE ────────────────────────────────────────────────────────
set "EDGE="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"       set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if exist "%LocalAppData%\Microsoft\Edge\Application\msedge.exe"       set "EDGE=%LocalAppData%\Microsoft\Edge\Application\msedge.exe"

if defined EDGE (
  echo Launching Sprint Fuel in Edge App Mode...
  start "" "%EDGE%" --app="%APP_URL%" --window-size=1150,850 --window-position=80,40 --no-first-run --disable-extensions --user-data-dir="%~dp0edge-data"
  goto :end
)

:: ── FALLBACK ────────────────────────────────────────────────────
echo Chrome and Edge not found. Opening in default browser...
start "" "%HTML%"

:end
popd
