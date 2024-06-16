FROM arm-dev:latest

USER dev
WORKDIR /home/dev

ARG STM_DEV=G0
ARG HEADERS_PROJ=STM32Cube$STM_DEV
ARG HEADERS_URL=https://github.com/STMicroelectronics/$HEADERS_PROJ.git
ARG HEADERS_TAG=v1.6.1
RUN git clone --single-branch --depth=1 -b $HEADERS_TAG $HEADERS_URL $HEADERS_PROJ &&\
  cd $HEADERS_PROJ &&\
  git checkout $HEADERS_COMMIT
WORKDIR $HEADERS_PROJ
USER root
ARG HEADERS_INSTALL_DIR=/opt/STM32/STM32$STM_DEV
RUN mkdir -p $HEADERS_INSTALL_DIR
RUN cp Drivers/CMSIS/Device/ST/STM32${STM_DEV}xx/Include/* \
  Drivers/CMSIS/Include/* \
  $HEADERS_INSTALL_DIR

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["code-server", "."]
