#!/usr/bin/env bash

set -e

IMAGE_NAME="file-operator-dummy-job"
TAG_VERSION="v1.1.0"

docker build --no-cache \
       . \
       -t openftth/$IMAGE_NAME:$TAG_VERSION \
       -t openftth/$IMAGE_NAME:latest \
       -f src/Dockerfile

docker push openftth/$IMAGE_NAME:$TAG_VERSION
docker push openftth/$IMAGE_NAME:latest
