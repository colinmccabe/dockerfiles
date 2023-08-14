FROM archlinux:base-devel-20230723.0.166908

RUN echo 'Server=https://archive.archlinux.org/repos/2023/07/23/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
