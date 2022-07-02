FROM c-dev:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm \
    arduino-builder \
    arduino-cli \
    python-pyserial \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ENV ESP_INDEX=package_esp32_index.json
COPY "$ESP_INDEX" ./
RUN arduino-cli \
  --additional-urls "file:///home/dev/$ESP_INDEX" \
  core download arduino:avr
RUN arduino-cli \
  --additional-urls "file:///home/dev/$ESP_INDEX" \
  core install arduino:avr

ENV EXT_BASE_URL=https://marketplace.visualstudio.com/_apis/public/gallery/publishers

ENV CPP_EXT_VER=1.7.1
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/ms-vscode/vsextensions/cpptools/$CPP_EXT_VER/vspackage" \
  && echo 'daf8247e9a10080fb5078af78766230619f161fda29c2a2334315700b87d8641  ext.vsix' | sha256sum -c - \
  && code --install-extension ext.vsix \
  && rm ext.vsix

ENV ARDUINO_EXT_VER=0.4.8
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/vsciot-vscode/vsextensions/vscode-arduino/$ARDUINO_EXT_VER/vspackage" \
  && echo '71d53edfb24dc87e8aec56055fc2374443217735eb342cca6bb10d6957d4b099  ext.vsix' | sha256sum -c - \
  && code --install-extension ext.vsix \
  && rm ext.vsix

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
