FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    deno \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ARG EXT_VER=3.17.0
ARG EXT_HASH=113c2952b61b3d71d290406ada8335682070b7d22d2dc5cc61cdd85a31cb8891
ARG EXT_VENDOR=denoland
ARG EXT_NAME=vscode-deno
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
COPY denoland.vscode-deno-3.17.0.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
