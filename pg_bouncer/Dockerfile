FROM debian:bullseye

RUN apt update && apt upgrade && apt install pgbouncer=1.15.0-1 -y

ENTRYPOINT [ "pgbouncer" ]