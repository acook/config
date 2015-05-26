#!/usr/bin/env bash

cd `dirname $0`
git diff-index --quiet HEAD --
git_dirty=$?

if [ $git_dirty -ne 0 ]; then
  echo Stashing local changes...
  git stash
fi

echo Updating local repo...
git pull --rebase origin master

echo Updating remote submodules...
git submodule update --init --recursive
git submodule foreach "git fetch -q && git checkout -q origin/HEAD"

if [ $git_dirty -ne 0 ]; then
  echo Restoring local changes...
  git unstash
fi

echo Updating Vim plugins...
vim -e +PlugUpgrade +PlugUpdate +qa! 2> /dev/null

echo Done!
