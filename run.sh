#!/bin/bash

set -euo pipefail

PWD=`pwd`

docker run \
  --rm \
  --name 'slate-app' \
  -v "$PWD/volumes/slate-app/db:/app/db" \
  -p 3000:3000 \
  -e SLATE_API_KEY=YOUR_API_KEY \
  ssanj/slate-scrib@sha256:c79a04d978ecb7b7ce8285d1b0c281111516aeaa6be13e88481ee9ebb81401b6