FROM arduino

COPY stm32-index.json /home/dev/
RUN arduino-cli \
  --additional-urls=file:///home/dev/stm32-index.json \
  core install STMicroelectronics:stm32
