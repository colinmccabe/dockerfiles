FROM archlinux:base-devel-20211121.0.39613

COPY mirrorlist /etc/pacman.d/

COPY packages .
RUN pacman -Sy --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN useradd -m -s /usr/bin/fish dev
USER dev
ENV PATH="/home/dev/.local/bin:${PATH}"
WORKDIR /home/dev

RUN mkdir -p .config/fish/functions
COPY robbyrussell.fish .config/fish/functions/fish_prompt.fish

COPY --chown=dev:dev ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout .

RUN mkdir -p project
WORKDIR project

ENTRYPOINT ["fish"]
