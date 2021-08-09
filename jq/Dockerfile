FROM alpine:3.13

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN apk add --no-cache jq

USER appuser

ENTRYPOINT ["jq"]
