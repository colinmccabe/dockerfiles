FROM archlinux:base-devel-20210131.0.14634

COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm
RUN pacman -Syu --noconfirm openssl-1.0 git jdk8-openjdk premake

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser
USER appuser
WORKDIR /home/appuser

RUN git clone https://aur.archlinux.org/aacskeys.git
WORKDIR aacskeys
RUN makepkg -c

USER root
RUN pacman -U --noconfirm aacskeys*.zst

USER appuser
