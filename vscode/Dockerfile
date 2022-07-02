FROM archlinux-dev:latest

USER root
RUN pacman -S --noconfirm --needed \
    code \
    ttf-dejavu \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

RUN mkdir -p '.config/Code - OSS/User'

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
