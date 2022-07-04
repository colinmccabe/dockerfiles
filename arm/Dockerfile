FROM c-dev:latest

USER root
RUN pacman -S --noconfirm \
    arm-none-eabi-binutils \
    arm-none-eabi-gcc \
    arm-none-eabi-gdb \
    arm-none-eabi-newlib \
    openocd \
  && pacman -Scc --noconfirm

USER dev

ENV EXT_VER=1.5.1
ENV EXT_HASH=9f8ab9fa1fe64eddf7bffd5180525c366704a175c3533a573376734395ef02ae
ENV EXT_VENDOR=marus25
ENV EXT_NAME=cortex-debug
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR /home/dev/project

ENTRYPOINT ["code", "-w", "."]
