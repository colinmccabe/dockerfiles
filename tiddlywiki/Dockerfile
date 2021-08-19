FROM node:14-bullseye-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl \
  && rm -rf /var/lib/apt/lists/*

RUN npm i -g tiddlywiki

USER appuser
ENV HOME /home/appuser

ENV TIDDLYWIKI_DIR $HOME/tiddlywiki
RUN mkdir $TIDDLYWIKI_DIR
WORKDIR $TIDDLYWIKI_DIR
RUN mkdir plugins
RUN mkdir tiddlers

WORKDIR plugins

ENV version_contextPlugin 4930b6afba14d7529498253520fe91b399eb4d3e
RUN curl -L "https://github.com/danielo515/TW5-contextPlugin/archive/$version_contextPlugin.tar.gz" \
  | tar -xz --strip-components=2 "TW5-contextPlugin-$version_contextPlugin/plugins/contextPlugin"

ENV version_extendedit 1473be18052637cdc6cb3ed6451b3b7032958baa
RUN curl -L "https://github.com/snowgoon88/TW5-extendedit/archive/$version_extendedit.tar.gz" \
  | tar -xz --strip-components=1 "TW5-extendedit-$version_extendedit/plugin"
RUN mv plugin extendedit

ENV version_relink 1.10.0
RUN curl -L "https://github.com/flibbles/tw5-relink/archive/v$version_relink.tar.gz" \
  | tar -xz --strip-components=2 "tw5-relink-$version_relink/plugins/relink"

COPY plugins/blinks ./blinks
COPY plugins/colin-config ./colin-config

WORKDIR $TIDDLYWIKI_DIR
COPY tiddlywiki.info .

ENTRYPOINT ["tiddlywiki"]
