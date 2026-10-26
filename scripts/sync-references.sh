#!/usr/bin/env bash
# Copy the canonical reference into each skill so every skill folder is self-contained
# (needed for .skill packaging and for installing a single skill).
# Edit references/socratic-method.md only, then run this script.
set -eu
cd "$(dirname "$0")/.."
for skill in skills/*/; do
  mkdir -p "$skill/references"
  cp references/socratic-method.md "$skill/references/socratic-method.md"
done
echo "synced references into: $(ls -d skills/*/ | tr '\n' ' ')"
