FROM python:3.7-alpine3.14

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN apk add --no-cache ffmpeg

USER appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"
WORKDIR /home/appuser

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

RUN mkdir -p .config/beets
RUN mkdir Music
RUN mkdir workdir

WORKDIR workdir

ENTRYPOINT ["beet"]
