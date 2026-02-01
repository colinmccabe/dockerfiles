FROM node:24-trixie-slim

USER node
WORKDIR /home/node
COPY package* ./
RUN npm ci

RUN mkdir .claude

RUN mkdir -p workdir
WORKDIR workdir

ENTRYPOINT ["/home/node/node_modules/.bin/claude"]
