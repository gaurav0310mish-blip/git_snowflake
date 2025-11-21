#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${ADW_CONNECT_STRING:-}" ]]; then
  echo "ADW_CONNECT_STRING env var not set."
  exit 1
fi

echo "Running ADW ingestion using SQLcl..."

sql -s /nolog <<EOF
CONNECT ${ADW_USERNAME}/${ADW_PASSWORD}@${ADW_CONNECT_STRING}
@sql/10_create_tables.sql
@sql/99_load_all.sql
EXIT
EOF

echo "ADW ingestion completed."
