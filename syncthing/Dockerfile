FROM debian:bullseye-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    syncthing \
  && rm -rf /var/lib/apt/lists/*

USER appuser
WORKDIR /home/appuser
RUN mkdir -p .config/syncthing
RUN mkdir Sync

ENTRYPOINT ["syncthing"]
