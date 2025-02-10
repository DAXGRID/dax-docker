#!/usr/bin/env bash

set -e

TAG_VERSION="v0.31.1"
NAMESPACE="openftth"
IMAGE_NAME="jsonschema-check"

docker build --no-cache \
       -t $NAMESPACE/$IMAGE_NAME:$TAG_VERSION \
       -t $NAMESPACE/$IMAGE_NAME:latest \
       .

docker push $NAMESPACE/$IMAGE_NAME:$TAG_VERSION
docker push $NAMESPACE/$IMAGE_NAME:latest
