FROM archlinux:base-devel-20251228.0.475343

RUN echo 'Server=https://archive.archlinux.org/repos/2026/01/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
