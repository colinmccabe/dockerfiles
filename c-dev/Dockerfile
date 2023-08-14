FROM code-server:latest

WORKDIR /home/dev

ENV EXT_VER=1.16.3
ENV EXT_HASH=141c8e4a0a9f752ae364d4a53200b326c97c96a507dae3ad0cd5b1a36abbb6f0
ENV EXT_VENDOR=ms-vscode
ENV EXT_NAME=cpptools
#RUN curl -L --compressed -o ext.vsix \
#    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage?targetPlatform=linux-x64" &&\
COPY $EXT_VENDOR.$EXT_NAME-$EXT_VER@linux-x64.vsix ext.vsix
RUN echo "$EXT_HASH  ext.vsix" | sha256sum -c - &&\
  code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
