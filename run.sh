#!/bin/bash

set -euo pipefail

PWD=`pwd`

docker run \
  --rm \
  --name 'slate-app' \
  -v "$PWD/volumes/slate-app/db:/app/db" \
  -p 5000:3000 \
  -e SLATE_API_KEY=YOUR_API_KEY \
  ssanj/slate-scrib@sha256:77ef9e968752dfa7f9f8bd3f353104fa98a1127c3158999b8fa66b325494df90