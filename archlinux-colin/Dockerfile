FROM archlinux:base-devel-20231105.0.189722

RUN echo 'Server=https://archive.archlinux.org/repos/2023/11/05/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
