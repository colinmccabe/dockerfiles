FROM archlinux:base-devel-20250601.0.358000

RUN echo 'Server=https://archive.archlinux.org/repos/2025/06/06/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
