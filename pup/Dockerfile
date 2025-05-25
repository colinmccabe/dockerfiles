FROM alpine:3.20

ARG PUP_VER=0.4.0
ARG PUP_HASH=ec3d29e9fb375b87ac492c8b546ad6be84b0c0b49dab7ff4c6b582eac71ba01c
ARG PUP_URL=https://github.com/ericchiang/pup/releases/download/v$PUP_VER/pup_v${PUP_VER}_linux_amd64.zip
WORKDIR /usr/local/bin
RUN wget $PUP_URL -O pup.zip &&\
  echo "$PUP_HASH  pup.zip" | sha256sum -c - &&\
  unzip pup.zip &&\
  chmod +x pup

USER colin

ENTRYPOINT ["pup"]
