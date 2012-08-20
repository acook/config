#!/usr/bin/env bash -

function post_install {

  echo Pulling remote submodules...
  $dir/update.sh 1>/dev/null

}
