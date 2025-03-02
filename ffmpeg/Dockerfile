from alpine:3.20

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN apk add --no-cache ffmpeg

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir
