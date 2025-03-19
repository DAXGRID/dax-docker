FROM debian:bullseye

RUN apt update && apt install pgbouncer=1.15.0-1 -y

RUN groupadd -r pgbouncer && useradd -r -g pgbouncer pgbouncer

WORKDIR /home/pgbouncer

USER pgbouncer

ENTRYPOINT [ "pgbouncer" ]