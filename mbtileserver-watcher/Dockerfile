FROM alpine:3.13.5

RUN apk --no-cache add bash=5.1.0-r0
RUN apk --no-cache add coreutils=8.32-r2

WORKDIR /scripts
COPY mbtileserver-watcher.sh .

ENTRYPOINT ["/bin/bash", "/scripts/mbtileserver-watcher.sh"]