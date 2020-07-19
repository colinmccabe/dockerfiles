FROM alpine:3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser

WORKDIR /usr/local/bin
RUN wget -O- https://github.com/cheat/cheat/releases/download/4.0.2/cheat-linux-amd64.gz \
  | zcat \
  > cheat
RUN chmod +x cheat

USER appuser
RUN mkdir /home/appuser/cheatsheets
WORKDIR /home/appuser/cheatsheets

ENTRYPOINT ["cheat"]
