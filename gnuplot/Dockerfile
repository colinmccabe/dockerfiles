FROM debian:trixie-slim

RUN apt-get update && apt-get -y install --no-install-recommends \
    gnuplot \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["gnuplot"]
