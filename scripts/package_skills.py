#!/usr/bin/env python3
"""Build dist/<skill>.skill for every skill (a zip with SKILL.md and references/, no evals).

Output is deterministic (fixed timestamps, sorted entries), so dist/ only changes
when a skill changes. Usage: python3 scripts/package_skills.py [output-dir]
"""
import sys, zipfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
out = Path(sys.argv[1]) if len(sys.argv) > 1 else root / "dist"
out.mkdir(parents=True, exist_ok=True)

for skill in sorted(p for p in (root / "skills").iterdir() if p.is_dir()):
    files = sorted(
        f for f in skill.rglob("*")
        if f.is_file() and "evals" not in f.relative_to(skill).parts and "__pycache__" not in f.parts
    )
    target = out / f"{skill.name}.skill"
    with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as z:
        for f in files:
            info = zipfile.ZipInfo(f"{skill.name}/{f.relative_to(skill).as_posix()}", (1980, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o644 << 16
            z.writestr(info, f.read_bytes())
    print(f"built {target.relative_to(root) if out.is_relative_to(root) else target} ({len(files)} files)")
