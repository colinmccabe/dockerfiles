FROM archlinux:base-devel-20241229.0.293060

RUN echo 'Server=https://archive.archlinux.org/repos/2025/01/05/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
