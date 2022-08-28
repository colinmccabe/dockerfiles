FROM archlinux:base-devel-20220821.0.76637

RUN echo 'Server=https://archive.archlinux.org/repos/2022/08/21/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
