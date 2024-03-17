FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    nodejs-lts-iron \
    npm \
    prettier \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["code-server", "."]
