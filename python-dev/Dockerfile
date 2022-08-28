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

ENV EXT_VER=2022.4.1
ENV EXT_HASH=66d00fd62fb4ad39be8d915c8be361c773f1fd1a4bf21558cf5b02101af7ccc3
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=python
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
