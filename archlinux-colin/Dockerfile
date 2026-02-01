FROM archlinux:base-devel-20260125.0.484595

RUN echo 'Server=https://archive.archlinux.org/repos/2026/02/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
