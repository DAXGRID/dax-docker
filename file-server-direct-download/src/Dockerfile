FROM alpine

ADD src/run.sh /

RUN apk add --no-cache jq curl bash

ENTRYPOINT ["/run.sh"]
