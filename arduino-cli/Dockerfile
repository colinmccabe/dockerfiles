FROM archlinux-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-builder \
    arduino-cli \
    python-pyserial \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin

ENV ESP_INDEX=package_esp8266com_index.json
COPY "$ESP_INDEX" ./
RUN arduino-cli \
  --additional-urls "file:///home/colin/$ESP_INDEX" \
  core download esp8266:esp8266
RUN arduino-cli \
  --additional-urls "file:///home/colin/$ESP_INDEX" \
  core install esp8266:esp8266

WORKDIR project
