FROM archlinux:base-devel-20250928.0.426921

RUN echo 'Server=https://archive.archlinux.org/repos/2025/10/03/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
