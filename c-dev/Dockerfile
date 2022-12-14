FROM code-server:latest

WORKDIR /home/dev

ENV EXT_VER=1.11.0
ENV EXT_HASH=c0725d3914aeb2515627691727455cc27e7a75031fa02ca957be02cc210bd64d
ENV EXT_VENDOR=ms-vscode
ENV EXT_NAME=cpptools
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/$EXT_VENDOR/vsextensions/$EXT_NAME/$EXT_VER/vspackage?targetPlatform=linux-x64" &&\
  echo "$EXT_HASH  ext.vsix" | sha256sum -c -
RUN code-server --install-extension ext.vsix &&\
  rm ext.vsix

WORKDIR project

ENTRYPOINT ["code-server", "."]
