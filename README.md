# db-schema (single source of truth for Prisma datamodel + migrations)

This repository is intended to be the **only** place where Prisma models/enums are edited
and where Prisma migrations are generated and stored.

Service repositories should:
- keep their own `prisma/schema/schema.prisma` (generator/datasource differ per service)
- include this repo as a **git submodule** at `prisma/schema/shared`
- remove local datamodel files and rely on `prisma/schema/shared/schema/**/*.prisma`

## Contents

- `schema/**.prisma` — shared datamodel files (**NO** generator/datasource blocks here)
- `prisma/migrations/**` — Prisma migration history
- `tooling/` — scripts to build a temporary schema workdir for running Prisma Migrate in this repo

## Local usage (generate migrations)

```bash
pnpm install
export POSTGRES_URL="postgresql://..."
# or
export DATABASE_URL="postgresql://..."
pnpm schema:validate
pnpm migrate:dev -- --name your_change
```

## Production usage (apply migrations)

In CI/CD:

```bash
export POSTGRES_URL="postgresql://..."
# or
export DATABASE_URL="postgresql://..."
pnpm migrate:deploy
```

> Use `migrate deploy` in staging/prod. Do not use `db push` there.

## Notes

- This repo intentionally does not contain `schema.prisma` (as a `.prisma` file) to avoid
  interfering with service repos when used as a submodule.
- See `tooling/prisma-migrate-template.prisma.txt` to adjust datasource/provider.
