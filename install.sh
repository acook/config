#!/usr/bin/env bash

# Archives the system's dotfiles
# Creates symlinks to the new dotfiles
# Put this in a SCM repo such as mercurial, git, or monotone with the dotfiles you want to install on multiple systems.
# Put all the dotfiles in the same directory as the install script and list them in the file variable.
# run with `./install.sh`

while getopts ":n" opt; do
  case $opt in
    n)
      noninteractive='true'
      ;;
    \?)
      echo "Ignoring invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [[ $noninteractive != 'true' ]]; then
  echo "Enter additional info to use for this configuration (pass -n to skip this in the future)."
  echo -ne "git name: "
  read $git_name
  echo -ne "git email: "
  read $git_email
  echo -ne "github username: "
  read $github_username
  echo -ne "github token: "
  read $github_token
fi

cd `dirname $0`

dir=`pwd`
dot_dir=$dir/dotfiles
backup_dir=$dir/backup

echo dot_dir: $dot_dir
echo backup_dir: $backup_dir

mkdir -v "$backup_dir"
files=`ls -1 -A $dot_dir`

for filename in $files; do
  if [ -h "$HOME/$filename" ]; then
    echo -ne "rm: symlink "
    rm -v "$HOME/$filename"
  else
    if [ -f "$HOME/$filename" ]; then
      echo -ne "mv: "
      mv -v "$HOME/$filename" "$backup_dir/"
    fi
  fi
  echo -ne "ln: "
  ln -vs "$dot_dir/$filename" "$HOME/$filename"
done

echo Pulling remote submodules...
$dir/update.sh 1>/dev/null

if [[ $noninteractive != 'true' ]]; then
  echo Writing config settings...
  git config --global user.name $git_name > /dev/null
  git config --global user.email $git_email > /dev/null
  git config --global github.user $github_username > /dev/null
  git config --global github.token $github_token > /dev/null
fi

echo "You should now source bashrc (source ~/.bashrc)"

echo Done!
