#!/usr/bin/env bash

set -e

VERSION_TAG="16"

docker build --no-cache \
       -t openftth/postgres-client:$VERSION_TAG \
       -t openftth/postgres-client:latest \
       .

docker push openftth/postgres-client:$VERSION_TAG
docker push openftth/postgres-client:latest
