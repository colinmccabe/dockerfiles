FROM arm-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-cli \
  && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*

USER colin

RUN mkdir /home/colin/Arduino
WORKDIR /home/colin/Arduino
