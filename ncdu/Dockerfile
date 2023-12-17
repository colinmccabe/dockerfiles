FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ncdu \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["ncdu"]
