FROM python:3.11-slim-bookworm

RUN groupadd -g 13472 appuser
RUN useradd -m -u 13472 -g appuser appuser

COPY requirements.txt .
RUN chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

USER appuser

ENTRYPOINT ["datasette"]
