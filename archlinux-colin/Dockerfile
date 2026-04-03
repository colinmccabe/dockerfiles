FROM archlinux:base-devel-20260329.0.507017

RUN echo 'Server=https://archive.archlinux.org/repos/2026/04/02/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
