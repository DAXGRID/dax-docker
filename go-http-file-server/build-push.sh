#!/usr/bin/env bash

docker build --no-cache -t openftth/go-http-file-server:v1.15.5_v2 -t openftth/go-http-file-server .

docker push openftth/go-http-file-server:v1.15.5_v2
docker push openftth/go-http-file-server:latest
