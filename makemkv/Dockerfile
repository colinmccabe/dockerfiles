FROM archlinux:base-devel

RUN pacman --noconfirm -Syu \
  && pacman --noconfirm -Scc
RUN pacman --noconfirm -S git ffmpeg jre11-openjdk \
  && pacman --noconfirm -Scc

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

ARG makemkv_commit=a0e78633043cf1e481693889cb62613e88d16c2b
RUN git clone https://aur.archlinux.org/makemkv-cli.git
WORKDIR makemkv-cli
RUN git checkout $makemkv_commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN echo yes | makepkg -crs

USER root
RUN pacman --noconfirm -U makemkv*.pkg.tar.zst

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["makemkvcon"]
