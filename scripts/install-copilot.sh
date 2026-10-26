#!/usr/bin/env bash
# Install the skills for GitHub Copilot (VS Code agent mode) as personal skills,
# and create the local log folder. Usage: scripts/install-copilot.sh [target-dir]
# Default target: ~/.copilot/skills. Pass <repo>/.github/skills to install in one project.
set -eu
cd "$(dirname "$0")/.."
./scripts/sync-references.sh >/dev/null
./scripts/validate-skills.sh
target="${1:-$HOME/.copilot/skills}"
mkdir -p "$target"
for dir in skills/*/; do
  s=$(basename "$dir")
  rm -rf "$target/$s"
  cp -R "$dir" "$target/$s"
  echo "installed $s -> $target/$s"
done
mkdir -p "$HOME/socratic-log"
echo "log folder: $HOME/socratic-log (keep it local, never in git)"
