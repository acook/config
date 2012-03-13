#!/usr/bin/env bash

echo 'Stashing any local changes'

stash_size=`git stash list | wc -l`

if [ $stash_size != "0" ]
  then
    echo >&2 'You already have files in your stash, resolve those first "git stash pop"'
    exit 1
fi

git stash 1>/dev/null

commit_diff_size=`git diff remotes/origin/HEAD --ignore-submodules | wc -l`

if [ $commit_diff_size != "0" ]
  then
    echo >&2 'You have local commits. Please push before trying this again.'
    exit 1
fi


echo 'Pulling Config Updates'

git pull --rebase


stash_size=`git stash list | wc -l`

if [ $stash_size != "0" ]
  then
    echo >&2 'Just a heads up you have changes in your stash now...'
    exit 1
fi
