FROM node:24-trixie-slim

RUN apt-get update && apt-get -y install --no-install-recommends \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /home/node
COPY package* ./
RUN npm ci

RUN mkdir -p workdir
WORKDIR workdir

ENTRYPOINT ["/home/node/node_modules/.bin/codex"]
