FROM archlinux:base-devel-20221002.0.91257

RUN echo 'Server=https://archive.archlinux.org/repos/2022/09/25/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
