FROM code-server:latest

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    flake8 \
    mypy \
    python \
    python-black \
    python-isort \
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

ENV EXT_VER=2024.5.12841012
ENV EXT_HASH=735a70f76ba55d8ae4f0b2f2d71848d6410f29f9aa601327cccd39a9f66da4b7
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=black-formatter
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

ENV EXT_VER=2023.13.12291011
ENV EXT_HASH=c610274698078976f80e263eb4a458bd8311583f231deabd96e96a7cb67b62ad
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=flake8
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

ENV EXT_VER=2023.13.12321012
ENV EXT_HASH=30ac08f4dd1c4054543b7f3efe05a7e137801b774e94b6a14f07631f8c3b2202
ENV EXT_VENDOR=ms-python
ENV EXT_NAME=isort
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
