#!/bin/sh
set -eu

INTERFACE=$1

if [ ! -p capture.fifo ]; then
  mkfifo capture.fifo
fi

sudo tcpdump -U -i "$INTERFACE" -w capture.fifo
