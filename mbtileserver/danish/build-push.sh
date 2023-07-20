#!/usr/bin/env bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Create tmp folder that we can store tmp data in
mkdir -p ./tmp

# Get openmaptiles to generate danish basemap
git clone -b v3.12.2 https://github.com/openmaptiles/openmaptiles.git ./tmp/openmaptiles
cp -rf ./env-openmaptiles ./tmp/openmaptiles/.env

(cd ./tmp/openmaptiles && ./quickstart.sh denmark)

# Create tilesets folder for tilesets and move tiles to it
mkdir -p ./tilesets
cp ./tmp/openmaptiles/data/tiles.mbtiles ./tilesets/osm.mbtiles

# Remove tmp folder to decrease the image size.
rm -rf ./tmp

# Build docker image with timestamp and push it
timestamp=$(date +%s)
docker build -t openftth/mbtileserver:danish-$timestamp .
docker push openftth/mbtileserver:danish-$timestamp
