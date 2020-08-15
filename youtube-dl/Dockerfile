FROM python:3.8-alpine3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"

RUN apk add --no-cache ffmpeg

USER appuser

RUN pip3 install --user --no-cache-dir youtube_dl

RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["youtube-dl"]
