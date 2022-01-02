FROM archlinux-dev:latest

USER root
RUN mkdir -p /opt/code-server
WORKDIR /opt/code-server
ARG CODE_VER=3.12.0
ARG CODE_HASH=d3ca41a55e36d73d80300702af2687e25d440cff6b613bb58a2c88d9b8a0a38f
ARG CODE_URL=https://github.com/cdr/code-server/releases/download/v$CODE_VER/code-server-$CODE_VER-linux-amd64.tar.gz
RUN curl -L $CODE_URL -o code-server.tar.gz \
  && echo "$CODE_HASH  code-server.tar.gz" | sha256sum -c - \
  && bsdtar -xf code-server.tar.gz --strip-components=1 \
  && rm code-server.tar.gz
ENV PATH "/opt/code-server/bin:${PATH}"

USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

WORKDIR project

ENTRYPOINT ["code-server", "."]
