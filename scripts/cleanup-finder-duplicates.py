#!/usr/bin/env python3
"""Remove macOS Finder / sync conflict copies named \"Name 2.ext\" when \"Name.ext\" exists.

Origin: copying or syncing into a folder that already has the file (Finder appends \" 2\").
Typical under Documents when iCloud Drive or Finder duplicate-on-conflict creates sidecars.
Never invent new \" 2\" files; run this script (or the agent rule) to clean them up.

Usage:
  python3 scripts/cleanup-finder-duplicates.py [root-dir ...]
Default roots: this repo and sibling neocom-front / neocom-back / neocom-domain when present.
"""

from __future__ import annotations

import argparse
import os
import sys
from pathlib import Path
from typing import Optional

PRUNE_DIR_NAMES = {".git", "node_modules", ".venv", "dist", "graphify-out", ".angular"}


def canonical_for(dup: Path) -> Optional[Path]:
    name = dup.name
    if " 2." in name:
        return dup.parent / name.replace(" 2.", ".", 1)
    if name.endswith(" 2"):
        return dup.parent / name[: -len(" 2")]
    return None


def iter_duplicates(root: Path):
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in PRUNE_DIR_NAMES]
        for name in filenames:
            if " 2." in name or name.endswith(" 2"):
                yield Path(dirpath) / name


def cleanup(roots: list[Path]) -> int:
    deleted = 0
    skipped = 0
    for root in roots:
        if not root.is_dir():
            continue
        for dup in list(iter_duplicates(root)):
            canon = canonical_for(dup)
            if canon is None:
                continue
            if canon.is_file():
                dup.unlink()
                print(f"deleted: {dup}")
                deleted += 1
            else:
                print(f"skipped (no canonical): {dup}")
                skipped += 1
    print(f"cleanup-finder-duplicates: deleted={deleted} skipped={skipped}")
    return 0 if skipped == 0 else 1


def default_roots(meta_root: Path) -> list[Path]:
    parent = meta_root.parent
    roots = [meta_root]
    for sib in ("neocom-front", "neocom-back", "neocom-domain"):
        path = parent / sib
        if path.is_dir():
            roots.append(path)
    return roots


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "roots",
        nargs="*",
        type=Path,
        help="Roots to scan (default: meta + sibling product repos)",
    )
    args = parser.parse_args()
    meta_root = Path(__file__).resolve().parent.parent
    roots = [p.resolve() for p in args.roots] if args.roots else default_roots(meta_root)
    return cleanup(roots)


if __name__ == "__main__":
    sys.exit(main())
