#!/usr/bin/env bash

# Archives the system's dotfiles
# Creates symlinks to the new dotfiles
# Put this in a SCM repo such as mercurial, git, or monotone with the dotfiles you want to install on multiple systems.
# Put all the dotfiles in the same directory as the install script and list them in the file variable.
# run with `./install.sh`

set -o nounset                              # Treat unset variables as an error

cd `dirname $0`
export dir=`pwd`
export dot_dir=$dir/dotfiles
export backup_dir=$dir/backup

source $dir/script/load_aliases.sh
source $dir/script/load_functions.sh

parse_commandline_options

echo Running pre install scripts...
load_directory $dir/script/pre_install pre_install

backup_and_link_directory $dot_dir $HOME $backup_dir

echo Running post install scripts...
load_directory $dir/script/post_install post_install

echo "You should now reload your bash configuration (source ~/.bashrc)"
echo Done!
