FROM debian:bookworm-slim

RUN apt-get update &&\
  apt-get install -y --no-install-recommends \
    rtl-433 \
  &&\
  rm -rf /var/lib/apt/lists/*

RUN groupadd -g 16980 colin
RUN useradd -m -u 16980 -g colin colin
USER colin

ENTRYPOINT ["rtl_433"]
