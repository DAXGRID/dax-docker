#!/usr/bin/env bash

set -e

VERSION_TAG="16-3.4"

docker build --no-cache \
       -t openftth/postgis:$VERSION_TAG \
       -t openftth/postgis:latest \
       .

docker push openftth/postgis:$VERSION_TAG
docker push openftth/postgis:latest
