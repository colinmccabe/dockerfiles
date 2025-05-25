FROM debian:bookworm-slim

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    syncthing \
  && rm -rf /var/lib/apt/lists/*

USER colin
WORKDIR /home/colin
RUN mkdir -p .config/syncthing
RUN mkdir Sync

ENTRYPOINT ["syncthing"]
