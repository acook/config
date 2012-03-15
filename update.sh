#!/usr/bin/env bash

echo Updating remote submodules...
git submodule update --init --recursive
git submodule foreach "git co master"
git submodule foreach "git pull"
