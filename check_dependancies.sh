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

echo 'Checking for rails_helpers'

if [ ! -f "rails_helpers" ]
  then
    echo 'Downloading rails_helpers'
    git clone git://gist.github.com/702727.git tmp
    cp tmp/rails_helpers .
    rm -rf tmp
    chmod +x rails_helpers
  else
    echo '-- rails_helpers found'
fi

echo ""

echo 'Checking for ack'

existance='true'
type ack-grep 2>/dev/null || existance='false'

if [ $existance == 'false' ]
then
  echo '-- Installing ack-grep'
  sudo apt-get install -y ack-grep
else
  echo '-- Found ack-grep'
fi

echo ''
echo "Dependency check finished"
