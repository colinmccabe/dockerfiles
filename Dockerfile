FROM archlinux/base:latest

ARG CODE_URL=https://github.com/cdr/code-server/releases/download/1.1119-vsc1.33.1/code-server1.1119-vsc1.33.1-linux-x64.tar.gz

COPY ./packages .
RUN pacman -Sy --noconfirm - < packages

WORKDIR /usr/local/bin
RUN curl -Ls $CODE_URL | bsdtar -xf - --strip-components=1 "$(basename $CODE_URL .tar.gz)/code-server"

RUN useradd -m -s /usr/bin/fish dev
USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share/code-server/extensions
RUN mkdir -p .local/share/code-server/User
RUN echo '{}' > .local/share/code-server/User/settings.json

RUN mkdir -p .config/fish/functions
RUN cp /usr/share/fish/tools/web_config/sample_prompts/robbyrussell.fish \
  .config/fish/functions/fish_prompt.fish

COPY --chown=dev:dev ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout

RUN mkdir -p project
WORKDIR project

RUN code-server --install-extension ms-python.python
ENV PIPENV_VENV_IN_PROJECT true

ENTRYPOINT ["code-server", "--allow-http", "--no-auth"]
