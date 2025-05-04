FROM archlinux-colin

RUN pacman -S --noconfirm --needed \
    git \
  && pacman -Scc --noconfirm

RUN groupadd -g 17105 appuser
RUN useradd -m -u 17105 -g appuser appuser

USER appuser
WORKDIR /home/appuser

ARG PKG_COMMIT=158389a333abd243956b43449b0e7825b705d446
RUN git clone https://aur.archlinux.org/geekbench.git
WORKDIR geekbench
RUN git checkout $PKG_COMMIT
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN echo yes | makepkg -crs

USER root
RUN pacman --noconfirm -U geekbench*.pkg.tar.zst

USER appuser
