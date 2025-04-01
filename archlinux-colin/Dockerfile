FROM archlinux:base-devel-20250330.0.328921

RUN echo 'Server=https://archive.archlinux.org/repos/2025/03/30/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc
