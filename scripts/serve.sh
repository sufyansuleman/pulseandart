#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-4000}"
URL="http://localhost:${PORT}/en/index.html"

# Make sure Windows py.exe is reachable in Git Bash
if [[ "$(uname -s)" == MINGW* ]] && [[ -x /c/Windows/py.exe ]]; then
  PATH="/c/Windows:${PATH}"
fi

# Detect Python (Git Bash friendly)
if [[ -x /c/Windows/py.exe ]]; then
  PYTHON_BIN="/c/Windows/py.exe -3.13"
elif command -v py >/dev/null 2>&1; then
  PYTHON_BIN="py -3.13"
elif command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Python is required (python3/python/py not found)." >&2
  exit 1
fi

# Go to repo root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "Serving from $(pwd) on port ${PORT}..."

# Open browser (Git Bash on Windows uses 'start')
if command -v start >/dev/null 2>&1; then
  start "" "${URL}" >/dev/null 2>&1 || true
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "${URL}" >/dev/null 2>&1 || true
fi

# Launch server
exec ${PYTHON_BIN} -m http.server "${PORT}"
