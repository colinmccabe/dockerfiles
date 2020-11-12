#!/usr/bin/env fish

argparse 'p/pull' -- $argv

if [ -n "$_flag_pull" ]; set build_flags --pull; end

for line in (cat commands)
  set image (string split ' ' $line)[1]
  echo "Building $image"
  pushd $image
  docker build $build_flags -t $image .
  if [ $status -ne 0 ]; exit; end
  popd
end

for line in (cat commands)
  set fields (string split ' ' $line)
  set image $fields[1]
  if [ -n $fields[2] ]
    set cmd $fields[2]
  else
    set cmd $image
  end
  echo "Linking $image $cmd"
  ln -sf (pwd)/$image/run ~/bin/$cmd
end
