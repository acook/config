#!/usr/bin/env bash -

function post_install {

  echo Pulling remote submodules...
  $dir/update.bash 1>/dev/null

}
