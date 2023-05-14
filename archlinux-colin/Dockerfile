FROM archlinux:base-devel-20230507.0.148551

RUN echo 'Server=https://archive.archlinux.org/repos/2023/05/07/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
