FROM archlinux-dev

USER colin
WORKDIR /home/colin
COPY package* ./
RUN npm ci

RUN mkdir -p workdir
WORKDIR workdir

ENTRYPOINT ["/home/colin/node_modules/.bin/codex"]
