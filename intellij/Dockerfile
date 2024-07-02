FROM vnc-dev

USER root
RUN pacman -S --noconfirm --needed \
    fontconfig \
    jdk21-openjdk \
    libxrender \
    libxtst \
    maven \
    ttf-dejavu \
  && pacman -Scc --noconfirm

ARG INTELLIJ_TAR=ideaIC-2024.1.4.tar.gz
ARG INTELLIJ_HASH=7d5e4cdb5a7cb1c376ca66957481350571561edadc3f45e6fce422e14af0fc16
WORKDIR /opt
COPY $INTELLIJ_TAR idea.tar.gz
RUN echo "$INTELLIJ_HASH  idea.tar.gz" \
  | sha256sum -c -
RUN mkdir idea
RUN tar -xf idea.tar.gz --strip-components=1 -C idea

USER dev
WORKDIR /home/dev

RUN mkdir -p .config/openbox
COPY openbox .config/openbox

RUN mkdir -p .{cache,config,local/share}/JetBrains

WORKDIR project
