FROM debian:bookworm-slim

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    transmission-cli \
    transmission-daemon \
  && rm -rf /var/lib/apt/lists/*

USER colin
RUN mkdir /home/colin/Downloads
WORKDIR /home/colin/Downloads
