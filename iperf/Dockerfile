FROM alpine:3.18

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN apk add --no-cache iperf3

USER appuser

ENTRYPOINT ["iperf3"]
