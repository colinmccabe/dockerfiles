#!/usr/bin/env fish

argparse 'p/pull' -- $argv

if [ -n "$_flag_pull" ]; set build_flags --pull; end

for cmd in (cat commands)
  echo "Building $cmd"
  pushd $cmd
  docker build $build_flags -t $cmd .
  popd
end

for cmd in (cat commands)
  echo "Linking $cmd"
  ln -sf (pwd)/$cmd/run ~/bin/$cmd
end
