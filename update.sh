#!/usr/bin/env bash

echo Updating remote submodules...
git submodule update --init
git submodule foreach "git co master"
git submodule foreach "git pull"
