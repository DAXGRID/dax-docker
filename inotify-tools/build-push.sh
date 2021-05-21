#!/usr/bin/env bash

docker build -t openftth/inotify-tools:3.20.11.0-r0 .
docker build -t openftth/inotify-tools:latest .

docker push openftth/inotify-tools:3.20.11.0-r0
docker push openftth/inotify-tools:latest
