#!/usr/bin/env bash
set -e

RELEASES_JSON_URL="https://api.github.com/repos/fabric8-analytics/cli-tools/releases/latest"

RELEASES_JSON_FILE="./downloads.json"
curl --silent --location --output "$RELEASES_JSON_FILE" "$RELEASES_JSON_URL"
JSON_PATH="assets.1.browser_download_url"

function traverseJson(){
  JSON_FILE="$1" JSON_PATH="$2" python3 -c "
import json, os
jsonPath = os.environ['JSON_PATH']
filePath = os.environ['JSON_FILE']
file = open(filePath)
data = json.load(file)
arrayPath = jsonPath.split('.')
for path in arrayPath:
    if path.isdigit():
      path = int(path)
    data = data[path]
print(data)
"
}

PACKAGE_URL="$(traverseJson "$RELEASES_JSON_FILE" "$JSON_PATH")"
curl --silent --location --output crda.deb "$PACKAGE_URL"
