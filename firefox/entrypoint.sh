#!/bin/sh

set -eu

cp user.js profile/

exec /usr/bin/firefox --class firefox-container --profile profile "$@"
