FROM node:12-buster-slim

RUN npm i -g tiddlywiki

RUN groupadd -g 801 appuser
RUN useradd -m -u 801 -g appuser appuser
USER appuser

WORKDIR /home/appuser
RUN mkdir data

ENTRYPOINT ["tiddlywiki"]
