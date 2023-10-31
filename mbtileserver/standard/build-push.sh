#!/usr/bin/env bash

set -e

VERSION_TAG="v0.10.0"

docker build --no-cache -t openftth/mbtileserver:$VERSION_TAG -t openftth/mbtileserver:latest .

docker push openftth/mbtileserver:$VERSION_TAG
docker push openftth/mbtileserver:latest
