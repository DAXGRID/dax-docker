#!/usr/bin/env bash

set -e

VERSION_TAG="18.6-3.6.4"

docker build --no-cache --pull \
       -t daxgrid/postgis:$VERSION_TAG \
       -t daxgrid/postgis:latest \
       .

docker push daxgrid/postgis:$VERSION_TAG
docker push daxgrid/postgis:latest
