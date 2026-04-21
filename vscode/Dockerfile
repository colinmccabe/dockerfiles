FROM vnc

USER root
RUN pacman -S --noconfirm --needed \
    code \
    ttf-dejavu \
  && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*

USER colin
WORKDIR /home/colin

RUN mkdir -p '.config/Code - OSS/User'
COPY ["settings.json", ".config/Code - OSS/User/"]

RUN mkdir -p .config/openbox
COPY openbox .config/openbox

WORKDIR project
