FROM localhost/vnc

USER root
RUN pacman -S --noconfirm \
    obsidian \
  && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*

COPY xdg-open-client /usr/local/bin/xdg-open

USER colin
WORKDIR /home/colin

RUN mkdir -p .config/openbox
COPY openbox .config/openbox

RUN mkdir -p .config/obsidian

RUN mkdir workdir
WORKDIR workdir
