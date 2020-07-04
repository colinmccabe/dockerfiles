FROM archlinux-dev:latest

USER root
WORKDIR /
COPY packages .
RUN pacman -Sy --noconfirm - < packages

RUN mkdir -p /opt/code-server
WORKDIR /opt/code-server
ARG CODE_URL=https://github.com/cdr/code-server/releases/download/3.4.1/code-server-3.4.1-linux-x86_64.tar.gz
RUN curl -Ls $CODE_URL | bsdtar -xf - --strip-components=1
ENV PATH "/opt/code-server/bin:${PATH}"

USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

RUN pip install --user pip-tools

# Python extension beyond 2020.5.86806 is broken.
# https://github.com/cdr/code-server/issues/1818
RUN curl -LO https://github.com/microsoft/vscode-python/releases/download/2020.5.86806/ms-python-release.vsix
RUN code-server --install-extension ms-python-release.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
