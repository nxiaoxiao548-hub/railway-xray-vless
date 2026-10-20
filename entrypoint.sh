#!/bin/sh
set -e
: "${UUID:?set UUID env}"
: "${WS_PATH:=/ray}"
: "${PORT:=8080}"
sed -e "s|PORT_PLACEHOLDER|$PORT|g" -e "s|UUID_PLACEHOLDER|$UUID|g" -e "s|WS_PATH_PLACEHOLDER|$WS_PATH|g" /app/config.template.json > /app/config.json
exec /app/xray run -c /app/config.json
