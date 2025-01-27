#!/usr/bin/env bash

set -e

VERSION_TAG="17.2-3.5.2"

docker build --no-cache \
       -t openftth/postgis:$VERSION_TAG \
       -t openftth/postgis:latest \
       .

docker push openftth/postgis:$VERSION_TAG
docker push openftth/postgis:latest
