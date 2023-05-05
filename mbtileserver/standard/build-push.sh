#!/usr/bin/env bash

set -e

docker build --no-cache -t openftth/mbtileserver:v0.9.0-v2 -t openftth/mbtileserver:latest .

docker push openftth/mbtileserver:v0.9.0-v2
docker push openftth/mbtileserver:latest
