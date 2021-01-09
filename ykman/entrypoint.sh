#!/bin/bash

set -euo pipefail

init() {
  local pcscd_running
  pcscd_running=$(pgrep pcscd || true)
  if [ -z "$pcscd_running" ]; then
    echo "Starting pcscd"
    pcscd --debug --apdu
    pcscd --hotplug
  else
    echo "pcscd is running already"
  fi
}

init
ykman "$@"
