FROM alpine:3.19

WORKDIR /usr/local/bin
ARG CHEAT_VER=4.2.0
ARG CHEAT_HASH=25d64ac3565c6976d3bb8508fb2a3434d7f7a696762735d3103e5bf039338338
ARG CHEAT_URL=https://github.com/cheat/cheat/releases/download/$CHEAT_VER/cheat-linux-amd64.gz
RUN wget $CHEAT_URL &&\
  echo "$CHEAT_HASH  cheat-linux-amd64.gz" | sha256sum -c - &&\
  gunzip -c cheat-linux-amd64.gz > cheat &&\
  chmod +x cheat

ENTRYPOINT ["cheat"]
