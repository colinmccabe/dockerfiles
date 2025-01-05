FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    mypy \
    python \
    python-ruff \
    python-pip \
    uv \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

RUN mkdir -p .config/pypoetry
COPY ./poetry.toml .config/pypoetry/config.toml

ENV EXT_VER=2024.13.2024081501
ENV EXT_HASH=a673173d833d125e4794757110118681dc03190a196011252fd77df9a5ea9587
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=python
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

ENV EXT_VER=2024.56.0
ENV EXT_HASH=31e0a303534aa0ed9d8bf2dc77a493b39a30838f4372e829aba833e21a3a47d7
ENV EXT_VENDOR=charliermarsh
ENV EXT_NAME=ruff
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

ENV EXT_VER=2024.1.12601012
ENV EXT_HASH=b213a4e758ebbb6c47abe2d4dc0a0c455e11a79fa79e561e6abef4148fbc9914
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=mypy-type-checker
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
