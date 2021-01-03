#!/bin/bash

set -euo pipefail

PWD=`pwd`

docker run \
  --rm \
  --name 'slate-app' \
  -v "$PWD/volumes/slate-app/db:/app/db" \
  -p 3000:3000 \
  -e SLATE_API_KEY=YOUR_API_KEY \
  ssanj/slate-scrib:v8-a2-SL_0.1.0.8-SC_0.1.0.0