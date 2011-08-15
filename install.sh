#!/usr/bin/env bash

# Archives the system's dotfiles
# Creates symlinks to the new dotfiles
# Put this in a SCM repo such as mercurial, git, or monotone with the dotfiles you want to install on multiple systems.
# Put all the dotfiles in the same directory as the install script and list them in the file variable.
# run with `./install.sh`

dir=`dirname $0`
dot_dir=$dir/dotfiles
backup_dir=$dir/backup

mkdir -v "$backup_dir"
cd "$dot_dir"

for filename in *; do
  if [ -h ~/$filename ]; then
    echo -ne "rm: symlink "
    rm -v "~/$filename"
  else
    if [ -f ~/$filename ]; then
      echo -ne "backup - "
      mv -v "~/$filename" "$backup_dir"
    fi
  fi
  echo -ne "ln: "
  ln -v -s "$dot_dir/$filename" "~/$filename"
done

echo Pulling remote submodules...
git submodule update --init
git submodule foreach "git pull"

echo Sourcing .bash_profile...
source ~/.bash_profile

echo Done!
