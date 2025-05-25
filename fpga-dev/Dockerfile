FROM intellij

USER root
RUN pacman -S --noconfirm --needed \
    gtkwave \
    riscv32-elf-binutils \
    riscv64-elf-gcc \
    sbt \
  && pacman -Scc --noconfirm

WORKDIR /opt
ARG OSS_VER=2023-11-12
ARG OSS_VER_NODASH=20231112
ARG OSS_HASH=5159171fc7cb2a11070f3ea429fdf713c193a6b799af388f7dbb9cef704c508d
ARG OSS_URL=https://github.com/YosysHQ/oss-cad-suite-build/releases/download/$OSS_VER/oss-cad-suite-linux-x64-$OSS_VER_NODASH.tgz
RUN curl -L $OSS_URL -o oss-cad-suite.tar.gz &&\
  echo "$OSS_HASH  oss-cad-suite.tar.gz" | sha256sum -c - &&\
  tar -xf oss-cad-suite.tar.gz &&\
  rm oss-cad-suite.tar.gz
ENV PATH "/opt/oss-cad-suite/bin:${PATH}"

USER colin
WORKDIR /home/colin
COPY openbox .config/openbox

WORKDIR project
