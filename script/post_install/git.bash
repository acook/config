#!/usr/bin/env bash -

function post_install {

  if [[ $noninteractive != 'true' ]]; then
    echo Writing Git config settings...
    git config --global user.name $git_name > /dev/null
    git config --global user.email $git_email > /dev/null
  fi

}
