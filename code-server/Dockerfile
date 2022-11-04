FROM archlinux-dev:latest

USER root
RUN mkdir -p /opt/code-server
WORKDIR /opt/code-server
ARG CODE_VER=4.8.2
ARG CODE_HASH=cac7070f96e810e8cbbbf49d634a7a1370435b2b585b59ec69cb54bd4fe78595
ARG CODE_URL=https://github.com/cdr/code-server/releases/download/v$CODE_VER/code-server-$CODE_VER-linux-amd64.tar.gz
RUN curl -L $CODE_URL -o code-server.tar.gz \
  && echo "$CODE_HASH  code-server.tar.gz" | sha256sum -c - \
  && bsdtar -xf code-server.tar.gz --strip-components=1 \
  && rm code-server.tar.gz
ENV PATH "/opt/code-server/bin:${PATH}"

USER dev
WORKDIR /home/dev

ENV EXT_BASE_URL=https://marketplace.visualstudio.com/_apis/public/gallery/publishers

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

WORKDIR project

ENTRYPOINT ["code-server", "."]
