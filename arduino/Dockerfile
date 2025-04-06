FROM arm-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-cli \
  && pacman -Scc --noconfirm

USER dev

RUN mkdir /home/dev/Arduino
WORKDIR /home/dev/Arduino
