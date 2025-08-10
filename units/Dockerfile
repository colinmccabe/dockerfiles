FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    units \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["units"]
