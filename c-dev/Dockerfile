FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    gdb \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ENV EXT_VER=1.23.0
ENV EXT_HASH=b714dedddf35145639cddf7c349d8899fcb75f53416508352060e0674feae03c
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
