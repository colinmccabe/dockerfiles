FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    delve \
    go \
    gopls \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin

ARG EXT_VER=0.36.0
ARG EXT_HASH=5c9fef6226c27b27efd7fcdcdb10317426e59e84548dc8ccef8fe3844e21d0c0
ARG EXT_VENDOR=golang
ARG EXT_NAME=go
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
