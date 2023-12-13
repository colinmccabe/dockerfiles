FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    qrencode \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 7884 appuser
RUN useradd -m -u 7884 -g appuser appuser
USER appuser

ENTRYPOINT ["qrencode"]
