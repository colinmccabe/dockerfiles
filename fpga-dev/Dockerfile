FROM code-server:latest

USER root
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

USER dev
WORKDIR /home/dev

RUN mkdir -p .local/share

ARG EXT_VER=1.13.0
ARG EXT_HASH=6b19972f056630299fed5a2fd0c6d26aa33ddb5b8a5037a083184236873a7980
ARG EXT_VENDOR=mshr-h
ARG EXT_NAME=VerilogHDL
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project
