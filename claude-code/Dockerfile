FROM archlinux-dev

USER colin
WORKDIR /home/colin
COPY package* ./
RUN npm ci

RUN mkdir .claude

RUN node node_modules/@anthropic-ai/claude-code/install.cjs

RUN mkdir -p workdir
WORKDIR workdir

ENTRYPOINT ["/home/colin/node_modules/.bin/claude"]
