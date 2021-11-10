#!/usr/bin/env bash

function post_install {

  [[ $antigen_confirm != 'y' ]] && return

  echo "Installing Antigen.zsh..."

  local target_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
  local antigen_dir="$target_dir/antigen"

  mkdir -p -v "$antigen_dir"

  curl --progress-bar -L -o "$antigen_dir/antigen.zsh" git.io/antigen

}
