from alpine:3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser

RUN apk add --no-cache ffmpeg

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["ffmpeg"]
