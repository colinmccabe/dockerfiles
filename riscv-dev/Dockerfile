FROM c-dev

USER root
WORKDIR /
RUN pacman -S --noconfirm --needed \
    riscv64-elf-gcc \
    riscv32-elf-binutils \
    riscv32-elf-gdb \
    riscv32-elf-newlib \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev/project
