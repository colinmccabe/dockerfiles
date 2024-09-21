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

ENV EXT_VER=2024.13.2024081501
ENV EXT_HASH=a673173d833d125e4794757110118681dc03190a196011252fd77df9a5ea9587
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
