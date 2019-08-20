FROM archlinux-dev:latest

USER root
WORKDIR /
COPY ./packages .
RUN pacman -Sy --noconfirm - < packages
RUN pacman -Scc

RUN sed -i 's/# %wheel/%wheel/' /etc/sudoers
RUN sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/" /etc/makepkg.conf

RUN usermod -a -G wheel dev

USER dev
WORKDIR /home/dev
ARG intellij_commit=891a333ea6bfc34ddfa32dc313065c2cad9c1f5b
RUN git clone https://aur.archlinux.org/intellij-idea-ultimate-edition.git \
  && cd intellij-idea-ultimate-edition \
  && git checkout $intellij_commit \
  && makepkg -cirs --noconfirm \
  && cd .. \
  && rm -rf intellij-idea-ultimate-edition

USER root
RUN gpasswd -d dev wheel
RUN pacman -Rsn --noconfirm sudo

USER dev
COPY --chown=dev:dev javaUserPrefs /home/dev/.java/.userPrefs

ENTRYPOINT ["intellij-idea-ultimate-edition", "/home/dev/project"]
