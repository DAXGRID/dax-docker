#!/usr/bin/env bash

set -e

docker build --no-cache -t openftth/mbtileserver-watcher:v1.1.0 -t openftth/mbtileserver-watcher:latest .

docker push openftth/mbtileserver-watcher:v1.1.0
docker push openftth/mbtileserver-watcher:latest
