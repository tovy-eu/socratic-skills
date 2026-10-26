#!/usr/bin/env bash
# Fast checks for every skill. Copilot ignores a skill silently when these fail.
# 1. frontmatter has name and description
# 2. name matches the folder, lowercase letters/digits/hyphens, max 64 chars
# 3. description max 1024 chars
# 4. every relative Markdown link in SKILL.md resolves
# 5. references/ copies match the canonical files
set -u
cd "$(dirname "$0")/.."
fail=0
err() { echo "FAIL $1: $2"; fail=1; }
for dir in skills/*/; do
  s=$(basename "$dir"); f="$dir/SKILL.md"
  [ -f "$f" ] || { err "$s" "SKILL.md missing"; continue; }
  name=$(sed -n '2,/^---$/p' "$f" | sed -n 's/^name: *//p' | head -1)
  desc=$(sed -n '2,/^---$/p' "$f" | sed -n 's/^description: *//p' | head -1)
  [ -n "$name" ] || err "$s" "name missing"
  [ -n "$desc" ] || err "$s" "description missing"
  [ "$name" = "$s" ] || err "$s" "name '$name' does not match folder"
  echo "$name" | grep -Eq '^[a-z0-9-]{1,64}$' || err "$s" "name has invalid characters or length"
  [ "${#desc}" -le 1024 ] || err "$s" "description is ${#desc} chars (max 1024)"
  while IFS= read -r link; do
    [ -e "$dir/$link" ] || err "$s" "broken link: $link"
  done < <(grep -o '](\(references\|scripts\)/[^)]*)' "$f" | sed 's/^](//; s/)$//')
  for ref in references/*.md; do
    cmp -s "$ref" "$dir/references/$(basename "$ref")" || err "$s" "references/$(basename "$ref") out of sync (run scripts/sync-references.sh)"
  done
done
[ "$fail" -eq 0 ] && echo "OK: $(ls -d skills/*/ | wc -l) skills valid"
exit "$fail"
