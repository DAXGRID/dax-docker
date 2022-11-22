#!/usr/bin/env bash

set -e

VERSION_TAG="v1.1.0"

docker build --no-cache \
       -t openftth/spritezero-cli:$VERSION_TAG \
       -t openftth/spritezero-cli:latest \
       .

docker push openftth/spritezero-cli:$VERSION_TAG
docker push openftth/spritezero-cli:latest
