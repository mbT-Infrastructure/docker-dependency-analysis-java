#!/usr/bin/env bash
set -e

MODE="all"

# help message
for ARGUMENT in "$@"; do
    if [ "$ARGUMENT" == "-h" ] || [ "$ARGUMENT" == "--help" ]; then
        echo "usage: $(basename "$0") [ARGUMENT]"
        echo "Analyses the dependencies."
        echo "ARGUMENT can be"
        echo "    --crda run only crda."
        exit
    fi
done

# check if run as root
if [[ "$(id --user)" != 0 ]]; then
    echo "Script must run as root"
    if [[ -n "$(which sudo)" ]];then
        echo "Try with sudo"
        sudo "$0" "$@"
        exit
    fi
    exit 1
fi

# check arguments
while [[ -n "$1" ]]; do
    if [[ "$1" == "--crda" ]]; then
        MODE="crda"
    else
        echo "Unknown argument: \"$1\""
        exit 1
    fi
    shift
done

if [[ "$MODE" == "all" ]] || [[ "$MODE" == "crda" ]]; then
    if [[ -z "$CRDA_KEY" ]]; then
        echo "$CRDA_SNYK_TOKEN" | crda auth > /dev/null
    fi
    crda analyse --no-color --verbose pom.xml
fi
