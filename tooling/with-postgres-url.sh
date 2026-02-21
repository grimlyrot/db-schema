#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${POSTGRES_URL:-}" && -n "${DATABASE_URL:-}" ]]; then
  export POSTGRES_URL="$DATABASE_URL"
fi

exec "$@"
