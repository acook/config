#!/usr/bin/env bash

echo 'Checking distro - Mac or Linux'

distro='Linux'
type apt-get 1>/dev/null 2>/dev/null || distro='Mac'

echo "Using $distro config"

if [ $distro == 'Linux' ]
then
  echo '-- Assuming Ubuntu'
fi

echo ''

echo 'Checking for ack'

existance='true'
type ack-grep 2>/dev/null || existance='false'

if [ $existance == 'false' ]
then
  if [ $distro == 'Linux' ]
  then
    echo '-- Installing ack-grep'
    sudo apt-get install -y ack-grep
  else
    echo >&2 '-- Currently not supporting installation on non-Linux'
  fi
else
  echo '-- Found ack-grep'
fi

echo ''
echo "Dependency check finished"
