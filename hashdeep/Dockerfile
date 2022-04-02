FROM debian:bullseye-slim

RUN apt-get update &&\
  apt-get install -y --no-install-recommends \
    hashdeep &&\
  rm -rf /var/lib/apt/lists/*

RUN groupadd -g 4650 appuser
RUN useradd -m -u 4650 -g appuser appuser
USER appuser
WORKDIR /home/appuser

ENTRYPOINT ["hashdeep"]
