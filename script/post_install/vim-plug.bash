#!/usr/bin/env bash

function post_install {
  echo "Installing Vim Plug for NeoVim..."

  sh -c 'curl --progress-bar -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  fish -c 'fisher update'

}
