#!/bin/bash -
function pre_install {

  local noninteractive=$1

  if [[ $noninteractive != 'true' ]]; then
    echo "Enter additional info to use for this configuration (pass -n to skip this in the future)."
    echo -ne "git name: "
    read $git_name
    echo -ne "git email: "
    read $git_email
    echo -ne "github username: "
    read $git_github_username
    echo -ne "github token: "
    read $git_github_token
  fi

}
