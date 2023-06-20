FROM archlinux:base-devel-20230604.0.155602

RUN echo 'Server=https://archive.archlinux.org/repos/2023/06/04/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
