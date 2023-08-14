FROM python:3.11-slim-bookworm

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

COPY requirements.txt .
RUN chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["datasette"]
