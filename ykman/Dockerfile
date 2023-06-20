FROM debian:bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    procps \
    pcscd \
    yubikey-manager \
  && rm -rf /var/lib/apt/lists/*

# Uncomment and set as entrypoint to run pcscd in container
#COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["ykman"]
