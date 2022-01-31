FROM alpine:3.14

RUN addgroup -g 4837 appuser
RUN adduser -D -u 4837 -G appuser appuser

RUN apk add --no-cache httpie

USER appuser
