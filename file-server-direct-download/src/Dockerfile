FROM debian

ADD src/run.sh /

RUN apt-get update && apt-get install -y jq

ENTRYPOINT ["/run.sh"]
