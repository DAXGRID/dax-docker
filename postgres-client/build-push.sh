#!/usr/bin/env bash

set -e

VERSION_TAG="18"

docker build --no-cache \
       -t daxgrid/postgres-client:$VERSION_TAG \
       -t daxgrid/postgres-client:latest \
       .

docker push daxgrid/postgres-client:$VERSION_TAG
docker push daxgrid/postgres-client:latest
