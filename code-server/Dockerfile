FROM archlinux-dev:latest

USER root
WORKDIR /
COPY packages .
RUN pacman -Sy --noconfirm - < packages

WORKDIR /usr/local/bin
ARG CODE_URL=https://github.com/cdr/code-server/releases/download/1.1156-vsc1.33.1/code-server1.1156-vsc1.33.1-linux-x64.tar.gz
RUN curl -Ls $CODE_URL | bsdtar -xf - --strip-components=1 "$(basename $CODE_URL .tar.gz)/code-server"

USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

RUN pip install --user pip-tools
RUN code-server --install-extension ms-python.python

WORKDIR project

ENTRYPOINT ["code-server", "--allow-http", "--no-auth"]
