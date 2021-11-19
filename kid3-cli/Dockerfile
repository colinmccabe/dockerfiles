FROM debian:bullseye-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    kid3-cli \
  && rm -rf /var/lib/apt/lists/*

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["kid3-cli"]
