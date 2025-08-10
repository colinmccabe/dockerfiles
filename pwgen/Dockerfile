FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    pwgen \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["pwgen"]
