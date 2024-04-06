FROM python:3.12-slim-bookworm

RUN groupadd -g 17105 appuser
RUN useradd -m -u 17105 -g appuser appuser

COPY requirements.txt .
RUN chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

ENTRYPOINT ["jc"]
