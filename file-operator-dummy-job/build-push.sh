#!/usr/bin/env bash

set -e

IMAGE_NAME="file-operator-dummy-job"
TAG_VERSION="v1.1.0"

docker build --no-cache \
       . \
       -t daxgrid/$IMAGE_NAME:$TAG_VERSION \
       -t daxgrid/$IMAGE_NAME:latest \
       -f src/Dockerfile

docker push daxgrid/$IMAGE_NAME:$TAG_VERSION
docker push daxgrid/$IMAGE_NAME:latest
