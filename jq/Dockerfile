FROM alpine:3.16

RUN apk add --no-cache jq

RUN addgroup -g 8956 appuser
RUN adduser -D -u 8956 -G appuser appuser
USER appuser

ENTRYPOINT ["jq"]
