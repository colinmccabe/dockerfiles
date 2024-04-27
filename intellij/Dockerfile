FROM archlinux-dev:latest

USER root
RUN pacman -S --noconfirm --needed \
    fontconfig \
    jdk21-openjdk \
    libxrender \
    libxtst \
    maven \
    ttf-dejavu \
  && pacman -Scc --noconfirm

ARG INTELLIJ_TAR=ideaIC-2024.1.tar.gz
ARG INTELLIJ_HASH=01d1b224c5e88592f954b17796a76fa8391cdcafef27264e703c7ffe47bb4065
WORKDIR /opt
COPY $INTELLIJ_TAR idea.tar.gz
RUN echo "$INTELLIJ_HASH  idea.tar.gz" \
  | sha256sum -c -
RUN mkdir idea
RUN tar -xf idea.tar.gz --strip-components=1 -C idea

USER dev
WORKDIR /home/dev

RUN mkdir -p .cache/JetBrains
RUN mkdir -p .config/JetBrains

WORKDIR project

ENTRYPOINT ["/opt/idea/bin/idea.sh", "/home/dev/project"]
