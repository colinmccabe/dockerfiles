FROM archlinux-colin

RUN pacman -S --noconfirm --needed \
    git \
  && pacman -Scc --noconfirm

RUN groupadd -g 24765 appuser
RUN useradd -m -u 24765 -g appuser appuser

USER appuser
WORKDIR /home/appuser

ARG PKG_COMMIT=4e33179af1a720c5cdf4204d1321751081b9cc6a
RUN git clone https://aur.archlinux.org/ncurses5-compat-libs.git
WORKDIR ncurses5-compat-libs
RUN git checkout $PKG_COMMIT
RUN makepkg --skippgpcheck --verifysource --noextract --noprepare --nobuild
RUN echo yes | makepkg -crs --skippgpcheck
USER root
RUN pacman --noconfirm -U *.pkg.tar.zst
WORKDIR /home/appuser
RUN rm -rf ncurses5-compat-libs
USER appuser

ARG PKG_COMMIT=f97cd0afbe4467253fa6a6667f9001559ef8cc07
RUN git clone https://aur.archlinux.org/passmark-performancetest-bin.git
WORKDIR passmark-performancetest-bin
RUN git checkout $PKG_COMMIT
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN echo yes | makepkg -crs
USER root
RUN pacman --noconfirm -U *.pkg.tar.zst
WORKDIR /home/appuser
RUN rm -rf passmark-performancetest-bin
USER appuser
