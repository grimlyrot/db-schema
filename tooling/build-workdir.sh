#!/usr/bin/env bash
set -euo pipefail

# Build a temporary Prisma workdir that contains:
# - a schema.prisma with datasource+generator (from template)
# - the shared datamodel files from ./schema
# - migrations from ./prisma/migrations
#
# This lets the db-schema repo own migrations without shipping generator/datasource
# blocks as .prisma files that would interfere when this repo is used as a submodule
# inside service repos.

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$ROOT/.work"

rm -rf "$WORK"
mkdir -p "$WORK/prisma/schema"

# 1) Create schema.prisma from template
cp "$ROOT/tooling/prisma-migrate-template.prisma.txt" "$WORK/prisma/schema/schema.prisma"

# 2) Copy all datamodel files (*.prisma) from ./schema into workdir
rsync -a --include='*/' --include='*.prisma' --exclude='*' "$ROOT/schema/" "$WORK/prisma/schema/"

# 3) Attach migrations (symlink)
mkdir -p "$ROOT/prisma/migrations"
ln -s "$ROOT/prisma/migrations" "$WORK/prisma/migrations"

echo "Workdir built at: $WORK"
