FROM arduino

USER root
RUN pacman -S --noconfirm --needed \
    python-pipx \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin

RUN pipx install adafruit-nrfutil

COPY package_adafruit_index.json /home/colin/
RUN arduino-cli \
  --additional-urls=file:///home/colin/package_adafruit_index.json \
  core install adafruit:nrf52
