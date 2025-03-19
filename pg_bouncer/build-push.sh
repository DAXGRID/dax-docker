#!/usr/bin/env bash

set -e

VERSION_TAG="1.15.0-1-1"
IMAGE_NAME="daxgrid/pg_bouncer"

docker build --no-cache \
       -t $IMAGE_NAME:$VERSION_TAG \
       -t $IMAGE_NAME:latest \
       .

docker push $IMAGE_NAME:$VERSION_TAG
docker push $IMAGE_NAME:latest
