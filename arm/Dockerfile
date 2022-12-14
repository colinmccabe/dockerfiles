FROM c-dev:latest

USER root
RUN pacman -S --noconfirm \
    arm-none-eabi-binutils \
    arm-none-eabi-gcc \
    arm-none-eabi-gdb \
    arm-none-eabi-newlib \
    openocd \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

ENV PKG_NAME=stm32f0-headers-git
ENV PKG_URL=https://aur.archlinux.org/$PKG_NAME.git
ENV PKG_COMMIT=1576f68ba09d579bd8cdf3ec906a5603129ecf72
RUN git clone $PKG_URL $PKG_NAME &&\
  cd $PKG_NAME &&\
  git checkout $PKG_COMMIT &&\
  makepkg -crs &&\
  mv *.tar.zst ../$PKG_NAME.tar.zst &&\
  cd .. &&\
  rm -rf $PKG_NAME
USER root
RUN pacman --noconfirm -U $PKG_NAME.tar.zst
USER dev

ENV EXT_VER=1.5.1
ENV EXT_HASH=9f8ab9fa1fe64eddf7bffd5180525c366704a175c3533a573376734395ef02ae
ENV EXT_VENDOR=marus25
ENV EXT_NAME=cortex-debug
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
