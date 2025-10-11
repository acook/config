#!/usr/bin/env bash

cd "$(dirname "$0")"
git diff-index --quiet HEAD --
git_dirty=$?

if [ $git_dirty -ne 0 ]; then
  echo Stashing local changes...
  git stash
fi

echo Updating local repo...
git pull --rebase origin main

echo Updating remote submodules...
git submodule update --init --recursive
git submodule foreach "git fetch -q && git checkout -q origin/HEAD"

if [ $git_dirty -ne 0 ]; then
  echo Restoring local changes...
  git stash pop
fi

echo Updating Vim plugins...
\vim +PlugUpgrade +PlugUpdate +qa!
nvim +PlugUpgrade +PlugUpdate +qa!
# we have to do this in headless mode otherwise Mason will operate async, which means it will get killed before finishing its task
nvim --headless +"exe 'source' stdpath('config').'/neovim_first_setup.vim'" +qa!

echo Done!
