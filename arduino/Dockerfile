FROM arm-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-cli \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

WORKDIR project
