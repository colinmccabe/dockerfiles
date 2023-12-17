FROM python:3.11-slim-bookworm

RUN groupadd -g 16806 appuser
RUN useradd -m -u 16806 -g appuser appuser

COPY requirements.txt .
RUN chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

COPY ./json2yaml ./yaml2json /usr/local/bin/

ENTRYPOINT ["json2yaml"]
