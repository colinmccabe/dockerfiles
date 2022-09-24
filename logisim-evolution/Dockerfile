FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

ENV \
  CUSTOM_PORT="8080" \
  GUIAUTOSTART="true" \
  HOME="/config"

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jre \
  && rm -rf /var/lib/apt/lists/*

ENV BIN_VER=3.7.2
ENV BIN_HASH=448fa2a0e1e3d775001ae3f3b1e000cb7a100506248dafee7238f840c791661c
ENV BIN_URL=https://github.com/logisim-evolution/logisim-evolution/releases/download/v$BIN_VER/logisim-evolution-$BIN_VER-all.jar
WORKDIR /opt
RUN curl -L -o logisim-evolution.jar $BIN_URL &&\
  echo "$BIN_HASH  logisim-evolution.jar" \
  | sha256sum -c

COPY root/ /
