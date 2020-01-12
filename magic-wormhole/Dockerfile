FROM debian:buster-slim

RUN groupadd -g 801 appuser
RUN useradd -m -u 801 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
  && apt-get install -y --no-install-recommends magic-wormhole \
  && rm -rf /var/lib/apt/lists/*

USER appuser
RUN mkdir -p /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["wormhole"]
