FROM alpine:latest

RUN apk add --no-cache git curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
