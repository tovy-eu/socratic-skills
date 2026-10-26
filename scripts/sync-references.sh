#!/usr/bin/env bash
# Copy the canonical references into each skill so every skill folder is self-contained
# (needed for .skill packaging, for installing a single skill, and for Copilot).
# Edit only the files in references/, then run this script.
set -eu
cd "$(dirname "$0")/.."
for skill in skills/*/; do
  mkdir -p "$skill/references"
  cp references/*.md "$skill/references/"
done
echo "synced references into: $(ls -d skills/*/ | tr '\n' ' ')"
