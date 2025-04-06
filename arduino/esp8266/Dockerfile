FROM arduino

COPY package_esp8266com_index.json /home/dev/

RUN arduino-cli \
  --additional-urls=file:///home/dev/package_esp8266com_index.json \
  core install esp8266:esp8266
