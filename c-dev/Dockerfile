FROM code-server:latest

WORKDIR /home/dev

ENV EXT_VER=1.20.5
ENV EXT_HASH=6ab4c1b77516039ce8a3474bd38e12c7f353d4b512efa5df1884bde8d38cbc99
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
