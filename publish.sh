#!/bin/bash

set -euo pipefail

# Modify these when doing a new build
BUILD_VERSION='v13'
SLATE_VERSION='0.1.0.12'
SCRIB_VERSION='0.3.0.0'
IMAGE_VERSION="${BUILD_VERSION}-SL_${SLATE_VERSION}-SC_${SCRIB_VERSION}"

# v8-SL_0.1.0.8_SC_0.1.0.0
APP_VERSION="slate-scrib:$IMAGE_VERSION"
APP_REPO='ssanj'

docker build --build-arg SLATE_VERSION="$SLATE_VERSION" --build-arg SCRIB_VERSION="$SCRIB_VERSION" -t "$APP_REPO/$APP_VERSION" .
docker push "$APP_REPO/$APP_VERSION"