#!/usr/bin/env bash
set -e

if [[ -n "$TELEMETRY" ]]; then
    CONSENT_TELEMETRY="$TELEMETRY"
fi

export CONSENT_TELEMETRY

exec "$@"
