FROM archlinux/archlinux:base-devel-20240427.0.231975

RUN echo 'Server=https://archive.archlinux.org/repos/2024/04/27/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc
