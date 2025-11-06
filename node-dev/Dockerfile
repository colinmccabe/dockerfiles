FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    nodejs-lts-krypton \
    npm \
    prettier \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin/project

ENTRYPOINT ["code-server", "."]
