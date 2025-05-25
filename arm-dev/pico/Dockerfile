FROM arm-dev:latest

USER root
RUN pacman -S --noconfirm \
    cmake \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin

ENV PICO_SDK_PATH=/opt/pico-sdk
ENV PICO_SDK_URL=https://github.com/raspberrypi/pico-sdk.git
ENV PICO_SDK_COMMIT=6a7db34ff63345a7badec79ebea3aaef1712f374
RUN git clone --single-branch --depth=1 $PICO_SDK_URL &&\
  cd pico-sdk &&\
  git fetch --depth 1 origin $PICO_SDK_COMMIT &&\
  git checkout $PICO_SDK_COMMIT &&\
  git submodule update --init &&\
  cd ..
USER root
RUN cp -r pico-sdk $PICO_SDK_PATH &&\
  rm -r pico-sdk

USER colin
WORKDIR project

ENTRYPOINT ["code-server", "."]
