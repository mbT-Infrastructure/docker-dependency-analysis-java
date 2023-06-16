#!/usr/bin/env bash
set -e

if [[ -n "$CRDA_CONSENT_TELEMETRY" ]]; then
    CONSENT_TELEMETRY="$CRDA_CONSENT_TELEMETRY"
fi

export CONSENT_TELEMETRY

exec "$@"
