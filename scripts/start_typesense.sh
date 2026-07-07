#!/bin/sh
set -eu

CORS_ARGS=""

if [ "${TYPESENSE_ENABLE_CORS:-false}" = "true" ]; then
    if [ -z "${TYPESENSE_CORS_DOMAINS:-}" ]; then
        echo "TYPESENSE_CORS_DOMAINS is required when TYPESENSE_ENABLE_CORS=true" >&2
        exit 1
    fi

    CORS_ARGS="--enable-cors --cors-domains ${TYPESENSE_CORS_DOMAINS}"
fi

exec /opt/typesense-server \
    --api-address 0.0.0.0 \
    --api-port 8118 \
    $CORS_ARGS
