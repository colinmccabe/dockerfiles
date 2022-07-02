FROM archlinux:base-devel-20220626.0.64095

RUN echo 'Server=https://archive.archlinux.org/repos/2022/06/26/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
