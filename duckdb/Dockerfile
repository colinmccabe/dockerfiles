FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /usr/local/bin
ARG PKG_VER=1.4.2
ARG PKG_HASH=fae3ba93eedf20b08bca4b23aeac1ba94c446f1c10d029c193e2fc4b4e0bc1bc
ARG PKG_URL=https://github.com/duckdb/duckdb/releases/download/v$PKG_VER/duckdb_cli-linux-amd64.zip
RUN curl -L -o pkg.zip $PKG_URL &&\
  echo "$PKG_HASH  pkg.zip" | sha256sum -c - &&\
  unzip -j pkg.zip &&\
  chmod +x duckdb &&\
  rm pkg.zip
  
RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin
USER colin

RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

RUN duckdb -c 'INSTALL spatial;'

ENTRYPOINT ["duckdb"]
