# Stage 1: compile mbtileserver
FROM golang:1.20-alpine3.16

WORKDIR /
RUN apk add git build-base

RUN git clone -b v0.9.0 https://github.com/consbio/mbtileserver.git repo

WORKDIR /repo

RUN GOOS=linux go build -o /mbtileserver

# Stage 2: start from a smaller image
FROM alpine:3.16

WORKDIR /

# Link libs to get around issues using musl
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# copy the executable to the empty container
COPY --from=0 /mbtileserver /mbtileserver

# add tiles directory to image
ADD tilesets /tilesets

# Set the command as the entrypoint, so that it captures any
# command-line arguments passed in
ENTRYPOINT ["/mbtileserver"]
