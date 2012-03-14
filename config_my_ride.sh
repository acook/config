#!/usr/bin/env bash

echo 'Setting up all your configs'
echo "Configure ride `hostname`"

./reset_config_files.sh && ./check_dependancies.sh && ./install.sh
