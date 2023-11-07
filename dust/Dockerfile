FROM alpine:3.18

RUN addgroup -g 1670 appuser
RUN adduser -D -u 1670 -G appuser appuser

RUN apk add --no-cache dust

USER appuser

ENTRYPOINT ["dust"]
