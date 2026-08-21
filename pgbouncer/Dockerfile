FROM alpine:latest

RUN apk update && apk add pgbouncer=1.25.2-r0

RUN addgroup -S pgbouncer && adduser -S pgbouncer -G pgbouncer

WORKDIR /home/pgbouncer

USER pgbouncer

ENTRYPOINT [ "pgbouncer" ]
