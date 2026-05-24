#!/usr/bin/env bash

set -e

VERSION_TAG="18.4-3.6.3"

docker build --no-cache \
       -t openftth/postgis:$VERSION_TAG \
       -t openftth/postgis:latest \
       .

docker push openftth/postgis:$VERSION_TAG
docker push openftth/postgis:latest
