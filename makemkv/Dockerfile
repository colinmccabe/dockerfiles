FROM archlinux-colin

RUN pacman --noconfirm -S \
    git \
    ffmpeg \
    jre11-openjdk \
    openssl-1.1 \
  && pacman --noconfirm -Scc

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

ARG makemkv_commit=7a572bca5b4546ae19a356b7dfbb660be917462d
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
