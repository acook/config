#!/usr/bin/env bash

# Archives the system's dotfiles
# Creates symlinks to the new dotfiles
# Put this in a SCM repo such as git with the dotfiles you want to install on multiple systems.
# Put all the dotfiles in the same directory as the install script and list them in the file variable.
# run with `./install.bash`

set -o nounset                              # Treat unset variables as an error to make debugging easier

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

# ensure we are in the directory containing this script so we can use relative paths
cd "$(dirname "$0")" || exit 1
export dir=$(pwd)
export dot_dir=$dir/dotfiles
export backup_dir=$dir/backup

echo Loading aliases...
# shellcheck source=script/load_aliases.bash
source $dir/script/load_aliases.bash

echo Loading functions...
# shellcheck source=script/load_functions.bash
source $dir/script/load_functions.bash

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
