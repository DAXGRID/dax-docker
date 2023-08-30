#!/usr/bin/env bash

set -e

TAG_VERSION="v1.15.14"

docker build --no-cache \
       -t openftth/go-http-file-server:$TAG_VERSION \
       -t openftth/go-http-file-server:latest \
       .

docker push openftth/go-http-file-server:$TAG_VERSION
docker push openftth/go-http-file-server:latest
