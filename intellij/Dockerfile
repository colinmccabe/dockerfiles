FROM archlinux-dev:latest

USER root
WORKDIR /
COPY ./packages .
RUN pacman -Sy --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/" /etc/makepkg.conf

USER dev
WORKDIR /home/dev
ARG intellij_commit=59c255b1805a689ce472a680b60f1d14c2baa8fa
RUN git clone https://aur.archlinux.org/intellij-idea-ultimate-edition.git
WORKDIR intellij-idea-ultimate-edition
RUN git checkout $intellij_commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN makepkg -crs

USER root
RUN pacman --noconfirm -U intellij-idea-ultimate-edition-jre-2020.2.1-1-x86_64.pkg.tar.zst
RUN pacman --noconfirm -U intellij-idea-ultimate-edition-2020.2.1-1-any.pkg.tar.zst

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["intellij-idea-ultimate-edition", "/home/dev/project"]
