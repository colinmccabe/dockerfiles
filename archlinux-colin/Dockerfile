FROM archlinux:base-devel-20251019.0.436919

RUN echo 'Server=https://archive.archlinux.org/repos/2025/11/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
