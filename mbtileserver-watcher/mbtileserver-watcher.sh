#!/usr/bin/env bash

FOLDER=$1
LAST_RUN=$(date --date '-1 min')

printf 'Starting to watch *.mbtiles\n'

while true
do
    MIN_FROM_NOW=$(date --date '-1 min')
    if [[ "$LAST_RUN" < "$MIN_FROM_NOW" ]]; then
        LINES=$(find $FOLDER -type f -name '*.mbtiles' -mmin -1 | wc -l)
        if (( $LINES > 0 )); then
            printf '%s - Mbtile updated, sending -HUP kill\n' "$(date)"
            sleep 10
            kill -HUP $(pgrep mbtileserver)
            LAST_RUN=$(date)
        fi
    fi
  sleep 30
done
