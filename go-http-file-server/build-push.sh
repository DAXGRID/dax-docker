#!/usr/bin/env bash

docker build --no-cache -t openftth/go-http-file-server:v1.12.0 -t openftth/go-http-file-server .

docker push openftth/go-http-file-server:v1.12.0
docker push openftth/go-http-file-server:latest
