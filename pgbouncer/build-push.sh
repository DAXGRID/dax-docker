#!/usr/bin/env bash

set -e

VERSION_TAG="1.23.1-r0"
IMAGE_NAME="daxgrid/pgbouncer"

docker build --no-cache \
       -t $IMAGE_NAME:$VERSION_TAG \
       -t $IMAGE_NAME:latest \
       .

docker push $IMAGE_NAME:$VERSION_TAG
docker push $IMAGE_NAME:latest
