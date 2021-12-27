FROM archlinux-dev:latest

USER root
RUN pacman -Sy --noconfirm --needed \
    code \
    ttf-dejavu \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

RUN mkdir -p '.config/Code - OSS/User'

ENV PY_EXT_VER=2021.12.1559732655
RUN curl -L --compressed -o python.vsix \
  "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/python/$PY_EXT_VER/vspackage"
RUN echo '8574d567b81bbb6df8cf2020d19ad93d4a3aa142c1f7c6a9c5eefd536c901c3e  python.vsix' \
  | sha256sum -c -
RUN code --install-extension python.vsix
# Jupyter is bundled /w Python ext and pops an error msg
RUN code --uninstall-extension ms-toolsai.jupyter

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
