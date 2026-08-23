FROM debian:trixie-slim

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

WORKDIR /opt

ARG PKG_VER=1.23.0
ARG PKG_HASH=e31ba03eefbb8232e15dc7c0204df5e2158021d70cc94e3bc1e429e0b7d4b15a
ARG PKG_URL=https://github.com/sharkdp/numbat/releases/download/v$PKG_VER/numbat-v${PKG_VER}-x86_64-unknown-linux-gnu.tar.gz
ADD --checksum=sha256:$PKG_HASH \
  $PKG_URL \
  pkg.tar.gz
RUN <<EOF
tar -xf pkg.tar.gz --strip-components=1
chmod +x numbat
mv numbat /usr/local/bin
rm -rf *
EOF

USER colin
WORKDIR /home/colin
RUN mkdir -p .local/share/numbat/

RUN mkdir -p .config/numbat/
COPY \
  config.toml \
  init.nbt \
  .config/numbat/

ENTRYPOINT ["numbat"]
