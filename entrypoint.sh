#! /bin/bash
set -euo pipefail

echo "downloading slate executable"
curl -L -o slate https://github.com/ssanj/slate/releases/download/v0.1.0.7-1/slate-0.1.0.7-1-Linux

echo "downloading scrib bundle"
curl -L -o scrib.zip https://github.com/ssanj/scrib/releases/download/v0.1.0.0/scrib.zip

echo "making slate executable"
chmod +x slate

echo "creating test db"
touch test.db

echo "Creating SCRIB schema"
sqlite3 test.db '.read seed.ddl'

echo "Adding SCRIB data"
sqlite3 test.db '.read data.sql'

echo "Creating app directory"
mkdir -p /app/static

echo "Extracting scrib bundle to app/static"
unzip scrib.zip -d /app/static/

echo "Copying scrib executable to app"
cp scrib /app/

echo "Copying test db to app"
cp test.db /app/

echo "Changing to app directory"
cd app

echo "Starting app"
SLATE_API_KEY=$API_KEY ./slate
