FROM golang:1.20-alpine3.16

WORKDIR /
RUN apk add git build-base

RUN git config --global advice.detachedHead false
RUN git clone -b v1.15.12 https://github.com/mjpclab/go-http-file-server.git repo

WORKDIR /repo

RUN go build -o /ghfs

# Stage 2: start from a smaller image
FROM alpine:3.16

WORKDIR /

# copy the executable to the empty container
COPY --from=0 /ghfs /ghfs

ENTRYPOINT ["/ghfs"]
