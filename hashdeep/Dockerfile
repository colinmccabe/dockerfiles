FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    hashdeep \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["hashdeep"]
