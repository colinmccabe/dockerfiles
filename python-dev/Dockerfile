FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    flake8 \
    mypy \
    python \
    python-pip \
    python-poetry \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

RUN mkdir -p .config/pypoetry
COPY ./poetry.toml .config/pypoetry/config.toml

ENV EXT_VER=2023.11.11841013
ENV EXT_HASH=d4c6dfbef2c92a5a6bf1f53aa3b7826fabb4abea125946eeb4c652f78026c89c
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=python
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
