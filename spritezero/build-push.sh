#!/usr/bin/env bash

VERSION=v1.1.0

docker build --no-cache -t openftth/spritezero-cli:$VERSION  .

docker push openftth/spritezero-cli:$VERSION
