#!/usr/bin/env bash

# Archives the system's dotfiles
# Creates symlinks to the new dotfiles
# Put this in a SCM repo such as mercurial, git, or monotone with the dotfiles you want to install on multiple systems.
# Put all the dotfiles in the same directory as the install script and list them in the file variable.
# run with `./install.sh`

set -o nounset                              # Treat unset variables as an error

# parse commandline options and configure accordingly
export noninteractive='false'
while getopts ":n" opt; do
  case $opt in
    n)
      export noninteractive='true'
      ;;
    \?)
      echo "Ignoring invalid option: -$OPTARG" >&2
      ;;
  esac
done

cd `dirname $0`
export dir=`pwd`
export dot_dir=$dir/dotfiles
export backup_dir=$dir/backup

echo Loading aliases...
source $dir/script/load_aliases.sh
echo Loading functions...
source $dir/script/load_functions.sh

echo Running pre install scripts...
load_directory $dir/script/pre_install pre_install

echo Installing configuration files...
backup_and_link_directory $dot_dir $HOME $backup_dir

echo Running post install scripts...
load_directory $dir/script/post_install post_install

echo
echo "Backups stored in $backup_dir"
echo "You should now reload your bash configuration (source ~/.bashrc)"
echo Done!
