#!/usr/bin/env bash

set -e

VERSION_TAG="v0.11.0-alpine-3.24"

docker build --no-cache -t daxgrid/mbtileserver:$VERSION_TAG -t daxgrid/mbtileserver:latest .

docker push daxgrid/mbtileserver:$VERSION_TAG
docker push daxgrid/mbtileserver:latest
