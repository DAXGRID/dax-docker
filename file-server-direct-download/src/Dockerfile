FROM debian

ADD src/run.sh /

RUN apt-get update && apt-get install -y jq curl

ENTRYPOINT ["/run.sh"]
