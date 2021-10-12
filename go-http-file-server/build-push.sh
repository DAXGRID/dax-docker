#!/usr/bin/env bash

docker build --no-cache -t openftth/go-http-file-server:v1.20.0 -t openftth/go-http-file-server .

docker push openftth/go-http-file-server:v1.20.0
docker push openftth/inotify-tools:latest
