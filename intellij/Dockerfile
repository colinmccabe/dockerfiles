FROM archlinux-dev:latest

USER root
WORKDIR /
COPY ./packages .
RUN pacman -Sy --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/" /etc/makepkg.conf

USER dev
WORKDIR /home/dev
ARG intellij_commit=9c3a51022526c7bb0a795ecf9ea34683056674be
ARG intellij_repo=https://aur.archlinux.org/intellij-idea-community-edition-jre.git
RUN git clone $intellij_repo intellij
WORKDIR intellij
RUN git checkout $intellij_commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN makepkg -crs

USER root
RUN pacman --noconfirm -U *.pkg.tar.zst

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["idea-ce", "/home/dev/project"]
