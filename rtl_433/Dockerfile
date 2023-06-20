FROM debian:bookworm-slim

RUN apt-get update &&\
  apt-get install -y --no-install-recommends \
    rtl-433 \
  &&\
  rm -rf /var/lib/apt/lists/*

RUN groupadd -g 16980 appuser
RUN useradd -m -u 16980 -g appuser appuser
USER appuser

ENTRYPOINT ["rtl_433"]
