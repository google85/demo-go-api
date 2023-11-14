FROM golang:1.19-buster as build

WORKDIR /app

COPY src/go.mod src/go.sum  ./