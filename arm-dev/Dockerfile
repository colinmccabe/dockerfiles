FROM c-dev:latest

USER root
RUN pacman -S --noconfirm \
    arm-none-eabi-binutils \
    arm-none-eabi-gcc \
    arm-none-eabi-gdb \
    arm-none-eabi-newlib \
    openocd \
  && pacman -Scc --noconfirm

WORKDIR /opt
RUN mkdir jlink
ENV PATH="/opt/jlink:${PATH}"
ARG JLINK_VER=796l
ARG JLINK_HASH=67489b1d16b9674c75ed37b907b724800cbe46681a1d9017d345ded28297a9c6
COPY ./JLink_Linux_V${JLINK_VER}_x86_64.tgz jlink.tgz
RUN echo "$JLINK_HASH jlink.tgz" | sha256sum -c -
RUN mkdir -p /opt/jlink &&\
  tar -x --strip-components=1 -f jlink.tgz -C jlink &&\
  rm jlink.tgz

USER dev
WORKDIR /home/dev

ENV EXT_VER=1.12.1
ENV EXT_HASH=8a82ba830b6468071fc67d7596aa7086ba482d27dfb7f6f2784aa812d2487ccd
ENV EXT_VENDOR=marus25
ENV EXT_NAME=cortex-debug
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
