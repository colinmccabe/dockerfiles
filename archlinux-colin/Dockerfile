FROM archlinux:base-devel-20250629.0.373469

RUN echo 'Server=https://archive.archlinux.org/repos/2025/07/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
