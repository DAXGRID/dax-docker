FROM golang:1.19-alpine3.16

WORKDIR /
RUN apk add git build-base

RUN git clone -b v1.15.5  https://github.com/mjpclab/go-http-file-server.git repo

WORKDIR /repo

RUN GO111MODULE=auto go build -o /ghfs src/main.go

# Stage 2: start from a smaller image
FROM alpine:3.16

WORKDIR /

# copy the executable to the empty container
COPY --from=0 /ghfs /ghfs

ENV GHFS_USERNAME GHFS_PASSWORD GHFS_ROOT_DIR GHFS_PORT

ENTRYPOINT ["sh", "-c", "exec /ghfs -l $GHFS_PORT --global-auth --user ${GHFS_USERNAME}:${GHFS_PASSWORD} -r $GHFS_ROOT_DIR -U --global-delete --global-mkdir"]