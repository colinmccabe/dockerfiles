FROM arduino

COPY stm32-index.json /home/colin/
RUN arduino-cli \
  --additional-urls=file:///home/colin/stm32-index.json \
  core install STMicroelectronics:stm32
