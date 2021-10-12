FROM golang:1.16-alpine3.12

WORKDIR /
RUN apk add git build-base

RUN git clone -b v1.12.0  https://github.com/mjpclab/go-http-file-server.git repo

WORKDIR /repo

RUN GO111MODULE=auto go build -o /ghfs src/main.go

# Stage 2: start from a smaller image
FROM alpine:3.12

WORKDIR /

# copy the executable to the empty container
COPY --from=0 /ghfs /ghfs

# Set the command as the entrypoint, so that it captures any
# command-line arguments passed in
ENTRYPOINT ["/ghfs"]