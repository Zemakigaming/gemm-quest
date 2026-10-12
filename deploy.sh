#!/bin/bash
# Usage: ./deploy.sh /workspace/gemm/GEMM_QUEST_vX.Y.Z.html
set -e; cd "$(dirname "$0")"; SRC="$1"; [ -f "$SRC" ] || { echo "usage: $0 <game.html>"; exit 1; }
V=$(grep -oP "window.GQ_VERSION = '\K[^']+" "$SRC"); cp "$SRC" index.html; printf '{"version":"%s"}\n' "$V" > version.json
git add -A && git commit -m "Deploy v$V" && git push origin main && echo "Deployed v$V -> https://zemakigaming.github.io/gemm-quest/"
