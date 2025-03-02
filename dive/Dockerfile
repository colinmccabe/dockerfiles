FROM alpine:3.20

ARG DIVE_VER=0.11.0
ARG DIVE_HASH=80835d3320292c4ab761d03c1fd33745ddb9b6064c035b65f77825f18f407d28
ARG DIVE_URL=https://github.com/wagoodman/dive/releases/download/v$DIVE_VER/dive_${DIVE_VER}_linux_amd64.tar.gz
WORKDIR /usr/local/bin
RUN wget $DIVE_URL -O dive.tar.gz &&\
  echo "$DIVE_HASH  dive.tar.gz" | sha256sum -c - &&\
  tar -xf dive.tar.gz dive &&\
  chmod +x dive &&\
  rm dive.tar.gz

COPY dive.yaml /mnt/dive.yaml

ENTRYPOINT ["dive"]
