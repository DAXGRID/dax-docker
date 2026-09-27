FROM golang:alpine

WORKDIR /
RUN apk add git build-base

RUN git config --global advice.detachedHead false
RUN git clone https://github.com/DAXGRID/go-http-file-server.git repo

WORKDIR /repo

RUN go build -o /ghfs

# Stage 2: start from a smaller image
FROM alpine

WORKDIR /

# copy the executable to the empty container
COPY --from=0 /ghfs /ghfs

ENTRYPOINT ["/ghfs"]
