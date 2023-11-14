FROM golang:1.19-buster as build

WORKDIR /app

COPY src/go.mod src/go.sum  ./

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download

COPY src/. .

RUN go build \
    -ldflags "-s -w" \
    -tags netgo \
    -o api-go-demo

#EXPOSE 8080