FROM archlinux:base-devel-20220501.0.54834

RUN echo 'Server=https://archive.archlinux.org/repos/2022/05/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

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
