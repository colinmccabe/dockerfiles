FROM archlinux:base-devel-20250126.0.301347

RUN echo 'Server=https://archive.archlinux.org/repos/2025/02/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
