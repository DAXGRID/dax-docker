FROM alpine:latest

RUN apk update && apk add pgbouncer=1.23.1-r0

RUN addgroup -S pgbouncer && adduser -S pgbouncer -G pgbouncer

WORKDIR /home/pgbouncer

USER pgbouncer

ENTRYPOINT [ "pgbouncer" ]
