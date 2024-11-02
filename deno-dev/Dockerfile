FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    deno \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ARG EXT_VER=3.42.0
ARG EXT_HASH=6df869231a87794a61e75541325281bdd04921e48ef44d598adadf565fccaa04
ARG EXT_VENDOR=denoland
ARG EXT_NAME=vscode-deno
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
