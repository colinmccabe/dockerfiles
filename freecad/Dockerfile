FROM debian:bookworm-slim

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    freecad \
  && rm -rf /var/lib/apt/lists/*

USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

ENTRYPOINT ["freecad"]
