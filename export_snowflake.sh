#!/usr/bin/env bash
set -euo pipefail

TABLE_NAME="${1:-MYTABLE}"
SOURCE_TABLE="${2:-$SNOW_DB.$SNOW_SCHEMA.$TABLE_NAME}"
STAGE_NAME="${3:-OCI_STAGE}"

echo "Exporting Snowflake table ${SOURCE_TABLE} to @${STAGE_NAME}/${TABLE_NAME}/ ..."

snowsql \
  -a "$SNOW_ACCOUNT" \
  -u "$SNOW_USER" \
  -w "$SNOW_WAREHOUSE" \
  -r "$SNOW_ROLE" \
  -q "COPY INTO @${STAGE_NAME}/${TABLE_NAME}/ FROM ${SOURCE_TABLE} FILE_FORMAT = (TYPE = PARQUET) OVERWRITE = TRUE;" \
  -o exit_on_error=true

echo "Export completed."
