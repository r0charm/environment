#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v stow &>/dev/null; then
  brew install stow
fi

stow -t ~ home
