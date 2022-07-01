FROM vscode:latest

WORKDIR /home/dev

ENV CPP_EXT_VER=1.7.1
ENV EXT_BASE_URL=https://marketplace.visualstudio.com/_apis/public/gallery/publishers
RUN curl -L --compressed -o ext.vsix \
    "$EXT_BASE_URL/ms-vscode/vsextensions/cpptools/$CPP_EXT_VER/vspackage" \
  && echo 'daf8247e9a10080fb5078af78766230619f161fda29c2a2334315700b87d8641  ext.vsix' | sha256sum -c - \
  && code --install-extension ext.vsix \
  && rm ext.vsix

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
