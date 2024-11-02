FROM arm-dev:latest

USER root

ARG STM_ORG=https://github.com/STMicroelectronics

ARG STM_DEV=L0
ARG STM_DEV_L=l0
ARG DEP_VER=1.9.3
ARG DEP_HASH=05b898a51ed34ac37ff63ea3abcd7a22a68d552a9d0d279586ffc6ca317906c6
ARG DEP_URL=$STM_ORG/cmsis_device_${STM_DEV_L}/archive/refs/tags/v$DEP_VER.tar.gz
ARG INSTALL_DIR=/opt/stm32/$STM_DEV
RUN mkdir -p $INSTALL_DIR/{include,startup}
COPY linker.ld $INSTALL_DIR
RUN curl -L $DEP_URL -o dep.tar.gz &&\
  echo "$DEP_HASH  dep.tar.gz" | sha256sum -c - &&\
  mkdir dep &&\
  tar -xf dep.tar.gz --strip-components=1 -C dep &&\
  cd dep/ &&\
  cp Include/* $INSTALL_DIR/include/ &&\
  cp Source/Templates/{*.c,gcc/*.s} $INSTALL_DIR/startup/ &&\
  cd .. &&\
  rm -rf dep dep.tar.gz
ARG DEP_VER=1.12.2
ARG DEP_HASH=a7c35cea9319d3612467b762a0454205dbd54368be9c4d5dc5b4f75286558f13
ARG DEP_URL=$STM_ORG/STM32Cube${STM_DEV}/archive/refs/tags/v$DEP_VER.tar.gz
RUN curl -L $DEP_URL -o dep.tar.gz &&\
  echo "$DEP_HASH  dep.tar.gz" | sha256sum -c - &&\
  mkdir dep &&\
  tar -xf dep.tar.gz --strip-components=1 -C dep &&\
  cd dep &&\
  cp Drivers/CMSIS/Include/* $INSTALL_DIR/include/ &&\
  cd .. &&\
  rm -rf dep dep.tar.gz

ARG STM_DEV=G0
ARG STM_DEV_L=g0
ARG DEP_VER=1.4.4
ARG DEP_HASH=f0b23d0c90220b43894105d7f58e15d4b7a0bd99fa7d19b9086582b7a4d256df
ARG DEP_URL=$STM_ORG/cmsis_device_${STM_DEV_L}/archive/refs/tags/v$DEP_VER.tar.gz
ARG INSTALL_DIR=/opt/stm32/$STM_DEV
RUN mkdir -p $INSTALL_DIR/{include,startup}
COPY linker.ld $INSTALL_DIR
RUN curl -L $DEP_URL -o dep.tar.gz &&\
  echo "$DEP_HASH  dep.tar.gz" | sha256sum -c - &&\
  mkdir dep &&\
  tar -xf dep.tar.gz --strip-components=1 -C dep &&\
  cd dep/ &&\
  cp Include/* $INSTALL_DIR/include/ &&\
  cp Source/Templates/{*.c,gcc/*.s} $INSTALL_DIR/startup/ &&\
  cd .. &&\
  rm -rf dep dep.tar.gz
ARG DEP_VER=1.6.2
ARG DEP_HASH=a67c7d59e488264717364410cf224b85ede3ededd739ed09ecc3fb455ec08c69
ARG DEP_URL=$STM_ORG/STM32Cube${STM_DEV}/archive/refs/tags/v$DEP_VER.tar.gz
RUN curl -L $DEP_URL -o dep.tar.gz &&\
  echo "$DEP_HASH  dep.tar.gz" | sha256sum -c - &&\
  mkdir dep &&\
  tar -xf dep.tar.gz --strip-components=1 -C dep &&\
  cd dep &&\
  cp Drivers/CMSIS/Include/* $INSTALL_DIR/include/ &&\
  cd .. &&\
  rm -rf dep dep.tar.gz

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["code-server", "."]
