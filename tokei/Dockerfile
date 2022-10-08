FROM alpine:3.16

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN apk add --no-cache tokei

USER appuser

ENTRYPOINT ["tokei"]
