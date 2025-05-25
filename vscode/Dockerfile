FROM archlinux-dev:latest

USER root
RUN pacman -S --noconfirm --needed \
    code \
    ttf-dejavu \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin

ENV EXT_BASE_URL=https://marketplace.visualstudio.com/_apis/public/gallery/publishers

RUN mkdir -p '.config/Code - OSS/User'

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
