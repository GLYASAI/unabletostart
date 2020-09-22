FROM golang:1.13 as builder
ENV CGO_ENABLED=0
ENV GOPATH=/go

WORKDIR /run
COPY main.go main.go

RUN go build  -o /run/unabletostart .


FROM alpine:3.11.2
COPY --from=builder /run/unabletostart /run/

ENTRYPOINT ["/run/unabletostart"]