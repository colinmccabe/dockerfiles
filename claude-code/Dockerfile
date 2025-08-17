FROM node:22-trixie-slim

USER node
WORKDIR /home/node
COPY package* ./
RUN npm ci

RUN mkdir -p workdir
WORKDIR workdir

RUN mkdir .claude

ENTRYPOINT ["/home/node/node_modules/.bin/claude"]
