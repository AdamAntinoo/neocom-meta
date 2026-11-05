#!/usr/bin/env python3
"""Remove macOS Finder / sync conflict copies named \"Name 2.ext\" (or dirs \"Name 2\")
when the canonical sibling exists.

Origin: copying or syncing into a folder that already has the file/dir (Finder appends \" 2\").
Typical under Documents when iCloud Drive or Finder duplicate-on-conflict creates sidecars.
Never invent new \" 2\" files; run this script (or the agent rule) to clean them up.

Usage:
  python3 scripts/cleanup-finder-duplicates.py [root-dir ...]
Default roots: this repo and sibling neocom-front / neocom-back / neocom-domain when present.
"""

from __future__ import annotations

import argparse
import os
import shutil
import sys
from pathlib import Path
from typing import Optional

PRUNE_DIR_NAMES = {".git", "node_modules", ".venv", "dist", "graphify-out", ".angular"}


def is_duplicate_name(name: str) -> bool:
    return " 2." in name or name.endswith(" 2")


def canonical_for(dup: Path) -> Optional[Path]:
    name = dup.name
    if " 2." in name:
        return dup.parent / name.replace(" 2.", ".", 1)
    if name.endswith(" 2"):
        return dup.parent / name[: -len(" 2")]
    return None


def iter_duplicates(root: Path):
    """Yield Finder duplicate files and directories (dirs after children)."""
    for dirpath, dirnames, filenames in os.walk(root, topdown=False):
        parts = set(Path(dirpath).parts)
        if parts & PRUNE_DIR_NAMES:
            continue
        for name in filenames:
            if is_duplicate_name(name):
                yield Path(dirpath) / name
        for name in dirnames:
            if name in PRUNE_DIR_NAMES:
                continue
            if is_duplicate_name(name):
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
            if dup.is_file() and canon.is_file():
                dup.unlink()
                print(f"deleted: {dup}")
                deleted += 1
            elif dup.is_dir() and canon.is_dir():
                shutil.rmtree(dup)
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
