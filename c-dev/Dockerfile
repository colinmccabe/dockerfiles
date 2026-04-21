FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    gdb \
  && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*

USER colin
WORKDIR /home/colin

ENV EXT_VER=1.23.6
ENV EXT_HASH=7118bf753a6ee21c770f98c80da56f940ec43d04593ffe32d4415aee2c8b1b5b
ENV EXT_VENDOR=ms-vscode
ENV EXT_NAME=cpptools
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage?targetPlatform=linux-x64" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER@linux-x64.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
