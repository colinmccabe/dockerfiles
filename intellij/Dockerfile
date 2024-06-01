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

ARG INTELLIJ_TAR=ideaIC-2024.1.1.tar.gz
ARG INTELLIJ_HASH=4d4221630c4d1dcb9f198370f82d9364014a4a624684ad8b3958be9f01eb656a
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

RUN mkdir -p .cache/JetBrains
RUN mkdir -p .config/JetBrains

WORKDIR project
