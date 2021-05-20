#!/usr/bin/env bash

DIR_TO_WATCH=${1}

PID_MBTILESERVER=$(pgrep mbtileserver)

watch -d -t -g ls -lR ${DIR_TO_WATCH} && kill -HUP $PID_MBTILESERVER
