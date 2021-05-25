#!/usr/bin/env bash

docker build --no-cache -t openftth/mbtileserver:v0.7.0 -t openftth/mbtileserver:latest .

docker push openftth/mbtileserver:v0.7.0
docker push openftth/mbtileserver:latest
