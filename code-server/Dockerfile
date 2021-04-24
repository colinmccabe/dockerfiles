FROM archlinux-dev:latest

USER root
RUN mkdir -p /opt/code-server
WORKDIR /opt/code-server
ARG CODE_VER=3.9.3
ARG CODE_HASH=eba42eaf868c2144795b1ac54929e3b252ae35403bf8553b3412a5ac4f365a41
ARG CODE_URL=https://github.com/cdr/code-server/releases/download/v$CODE_VER/code-server-$CODE_VER-linux-amd64.tar.gz
RUN curl -L $CODE_URL -o code-server.tar.gz \
  && echo "$CODE_HASH  code-server.tar.gz" > SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && rm SHA256SUMS \
  && bsdtar -xf code-server.tar.gz --strip-components=1
ENV PATH "/opt/code-server/bin:${PATH}"

USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

RUN code-server --install-extension ms-python.python

WORKDIR project

ENTRYPOINT ["code-server", "."]
