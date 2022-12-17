FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    deno \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ARG EXT_VER=3.14.0
ARG EXT_HASH=4af475540823ea5881d5895ab79e6758b069fd690d7e04eb68847f7f51bd59d4
ARG EXT_VENDOR=denoland
ARG EXT_NAME=vscode-deno
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
