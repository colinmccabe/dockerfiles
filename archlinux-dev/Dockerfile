FROM archlinux-colin

USER root
COPY packages .
RUN pacman -S --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

USER colin

ENV PATH="/home/colin/.local/bin:${PATH}"

RUN mkdir -p .local/share/fish
RUN mkdir -p .config/fish/functions
COPY robbyrussell.fish .config/fish/functions/fish_prompt.fish

COPY --chown=colin:colin ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout .

RUN mkdir -p project
WORKDIR project

ENTRYPOINT ["fish"]
