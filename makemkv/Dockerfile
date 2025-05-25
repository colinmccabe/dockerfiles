FROM archlinux-colin

RUN pacman --noconfirm -S \
    git \
    ffmpeg \
    jre11-openjdk \
    openssl-1.1 \
  && pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin

ARG makemkv_commit=7a572bca5b4546ae19a356b7dfbb660be917462d
RUN git clone https://aur.archlinux.org/makemkv-cli.git
WORKDIR makemkv-cli
RUN git checkout $makemkv_commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN echo yes | makepkg -crs

USER root
RUN pacman --noconfirm -U makemkv*.pkg.tar.zst

USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

ENTRYPOINT ["makemkvcon"]
