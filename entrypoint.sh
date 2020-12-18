#! /bin/bash
set -euo pipefail

echo "downloading slate executable"
curl -L -o slate https://github.com/ssanj/slate/releases/download/v${SLATE_VERSION}/slate-${SLATE_VERSION}-Linux

echo "downloading scrib bundle"
curl -L -o scrib.zip https://github.com/ssanj/scrib/releases/download/v${SCRIB_VERSION}/scrib.zip

echo "making slate executable"
chmod +x slate

echo "Creating app directory"
mkdir -p /app/static

echo "Extracting scrib bundle to app/static"
unzip scrib.zip -d /app/static/

echo "Copying slate executable to app"
cp slate /app/

echo "Changing to app directory"
cd /app

echo "Starting app"
SLATE_API_KEY=$API_KEY ./slate
