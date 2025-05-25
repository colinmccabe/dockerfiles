FROM arm-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-cli \
  && pacman -Scc --noconfirm

USER colin

RUN mkdir /home/colin/Arduino
WORKDIR /home/colin/Arduino
