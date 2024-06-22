FROM archlinux-colin

COPY packages .
RUN pacman -S --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN useradd -m -s /usr/bin/fish dev
USER dev
ENV PATH="/home/dev/.local/bin:${PATH}"
WORKDIR /home/dev

RUN mkdir -p .local/share/fish
RUN mkdir -p .config/fish/functions
COPY robbyrussell.fish .config/fish/functions/fish_prompt.fish

COPY --chown=dev:dev ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout .

RUN mkdir -p project
WORKDIR project

ENTRYPOINT ["fish"]
