from alpine:3.20

RUN addgroup -g 1000 colin
RUN adduser -D -u 1000 -G colin colin

RUN apk add --no-cache ffmpeg

USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir
