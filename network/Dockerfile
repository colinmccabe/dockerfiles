FROM debian:bookworm-slim

RUN apt-get update && apt-get -y install --no-install-recommends \
    bind9-dnsutils \
    ca-certificates \
    curl \
    netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash"]
