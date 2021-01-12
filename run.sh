#!/bin/bash

set -euo pipefail

PWD=`pwd`
DOCKER_IMAGE=$(head -n 1 .env | sed 's/export DOCKER_IMAGE=//')
echo "Using docker image: $DOCKER_IMAGE"
docker run \
  --rm \
  --name 'slate-app' \
  -v "$PWD/volumes/slate-app/db:/app/db" \
  -p 5000:3000 \
  -e SLATE_API_KEY=YOUR_API_KEY \
  $DOCKER_IMAGE