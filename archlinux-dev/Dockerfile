FROM archlinux/base:latest

COPY mirrorlist /etc/pacman.d/
COPY packages .
RUN pacman -Sy --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN useradd -m -s /usr/bin/fish dev
USER dev
ENV PATH="/home/dev/.local/bin:${PATH}"
WORKDIR /home/dev

RUN mkdir -p .config/fish/functions
RUN cp /usr/share/fish/tools/web_config/sample_prompts/robbyrussell.fish \
  .config/fish/functions/fish_prompt.fish

COPY --chown=dev:dev ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout .

RUN mkdir -p project
WORKDIR project

ENTRYPOINT ["fish"]
