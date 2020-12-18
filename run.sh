#!/bin/bash

set -euo pipefail

docker run \
  --rm \
  --name 'slate-app' \
  -v db:/app/db \
  -p 3000:3000 \
  -e API_KEY=$SLATE_API_KEY \
  -e SLATE_VERSION='0.1.0.8' \
  -e SCRIB_VERSION='0.1.0.0' \
  slate-scrib:v7