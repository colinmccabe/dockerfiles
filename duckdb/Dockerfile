FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /usr/local/bin
ARG PKG_VER=1.3.1
ARG PKG_HASH=a43e0156c9799496089dd265605113471df5a30a7db26e1c662484eb1d31fc08
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

ENTRYPOINT ["duckdb"]
