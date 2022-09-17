#!/usr/bin/env bash

set -e

docker build --no-cache -t openftth/inotify-tools:v3.20.11.0-r0 -t openftth/inotify-tools:latest .

docker push openftth/inotify-tools:v3.20.11.0-r0
docker push openftth/inotify-tools:latest
