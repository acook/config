#!/usr/bin/env bash

cd `dirname $0`
echo Updating remote submodules...
git submodule update --init --recursive
git submodule foreach "git fetch -q && git checkout -q origin/HEAD"
