#!/usr/bin/env fish

set base_images alpine:3.12 debian:buster-slim

for cmd in (cat commands)
  echo "Building $cmd"
  pushd $cmd
  docker build -t $cmd .
  popd
end

for cmd in (cat commands)
  echo "Linking $cmd"
  ln -sf (pwd)/$cmd/run ~/bin/$cmd
end
