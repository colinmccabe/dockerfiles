FROM alpine:3.14

RUN addgroup -g 1396 appuser
RUN adduser -D -u 1396 -G appuser appuser

WORKDIR /usr/local/bin

ENV DIVE_VER=0.10.0
ENV DIVE_HASH=9541997876d4985de66d0fa5924dac72258a3094ef7d3f6ef5fa5dcf6f6a47ad
RUN wget -O dive.tar.gz \
    "https://github.com/wagoodman/dive/releases/download/v$DIVE_VER/dive_${DIVE_VER}_linux_amd64.tar.gz" \
  && echo "$DIVE_HASH  dive.tar.gz" | sha256sum -c - \
  && tar -xf dive.tar.gz dive \
  && chmod +x dive \
  && rm dive.tar.gz

USER appuser
COPY dive.yaml /home/appuser/.dive.yaml

ENTRYPOINT ["dive"]
