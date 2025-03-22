FROM alpine:3.20

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

RUN mkdir numbat
WORKDIR numbat

ARG PKG_VER=1.16.0
ARG PKG_HASH=620dbac00df3c8df4f42fd816ac4b28153b1269873d87a981d6f67f4de50698b
ARG PKG_URL=https://github.com/sharkdp/numbat/releases/download/v$PKG_VER/numbat-v${PKG_VER}-i686-unknown-linux-musl.tar.gz
RUN wget $PKG_URL -O pkg.tar.gz &&\
  echo "$PKG_HASH  pkg.tar.gz" | sha256sum -c - &&\
  tar -xf pkg.tar.gz --strip-components=1 &&\
  chmod +x numbat &&\
  mv numbat /usr/local/bin &&\
  mkdir -p /usr/share/numbat &&\
  mv modules /usr/share/numbat/ &&\
  cd .. &&\
  rm -r numbat

USER appuser
WORKDIR /home/appuser
RUN mkdir -p .local/share/numbat/

ENTRYPOINT ["numbat"]
