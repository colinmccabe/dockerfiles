FROM code-server:latest

USER root
WORKDIR /
RUN pacman -Syu --noconfirm \
    flake8 \
    mypy \
    python \
    python-pip \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
    -r requirements.txt \
  && rm requirements.txt

ENV PY_EXT_VER=2021.10.1365161279
ENV PY_EXT_HASH=987b7e72662538d5b045d5a09ad7deb707e4d634607a09b16c45072e57259429
ENV VS_EXT_URL=https://marketplace.visualstudio.com/_apis/public/gallery/publishers
RUN curl -L --compressed -o ext.vsix "$VS_EXT_URL/ms-python/vsextensions/python/$PY_EXT_VER/vspackage" \
  && echo "$PY_EXT_HASH  ext.vsix" | sha256sum -c - \
  && code-server --install-extension ext.vsix \
  && code-server --uninstall-extension ms-toolsai.jupyter

WORKDIR project

ENTRYPOINT ["code-server", "."]
