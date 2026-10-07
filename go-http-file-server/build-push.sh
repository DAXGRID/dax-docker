#!/usr/bin/env bash

set -e

TAG_VERSION="v1.22.1"

docker build --no-cache \
       -t daxgrid/go-http-file-server:$TAG_VERSION \
       -t daxgrid/go-http-file-server:latest \
       .

docker push daxgrid/go-http-file-server:$TAG_VERSION
docker push daxgrid/go-http-file-server:latest
