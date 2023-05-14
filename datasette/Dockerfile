FROM python:3.11-alpine3.16

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

COPY requirements.txt .
RUN chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["datasette"]
