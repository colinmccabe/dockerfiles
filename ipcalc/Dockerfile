FROM alpine:3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser

RUN apk add --no-cache ipcalc

USER appuser

ENTRYPOINT ["ipcalc"]
