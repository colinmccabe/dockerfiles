FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    deno \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ARG EXT_VER=3.43.1
ARG EXT_HASH=6a7442d0ead72ed0463cab9a8f1f7f36881b0c4907f46aee7fafe995ed0fca52
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
