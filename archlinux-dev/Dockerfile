FROM archlinux:base-devel-20210131.0.14634

COPY mirrorlist /etc/pacman.d/

RUN pacman --noconfirm -Syu \
  && pacman --noconfirm -Scc

COPY packages .
RUN pacman -S --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

RUN useradd -m -s /usr/bin/fish dev
USER dev
ENV PATH="/home/dev/.local/bin:${PATH}"
WORKDIR /home/dev

RUN mkdir -p .config/fish/functions
RUN cp /usr/share/fish/tools/web_config/sample_prompts/robbyrussell.fish \
  .config/fish/functions/fish_prompt.fish

COPY --chown=dev:dev ./dotfiles.git .dotfiles.git
RUN git --git-dir=./.dotfiles.git --work-tree=. checkout .

RUN mkdir .m2
COPY m2-settings.xml .m2/settings.xml

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

RUN mkdir -p project
WORKDIR project

ENTRYPOINT ["fish"]
