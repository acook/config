#!/bin/bash

# Platform-specific setups
unamestr=$(uname)
case $unamestr in
  'Darwin')        # OSX
    # Set up MacPorts paths
    #export PATH=/opt/local/libexec/gnubin/:/opt/local/bin:/opt/local/sbin:$PATH
    #export MANPATH=/opt/local/share/man:$MANPATH
    # Give precedence to user/local/bin because that's where Homebrew installs their stuff
    export PATH=/usr/local/bin:$PATH

    # I can set alias ls=ls_osx if I don't have gnu coreutils installed
    alias ls_osx="ls -p -F -G -h"
    # Colorize ls
    export LSCOLORS=hxdxDxGxbxfxFxBxBxHxHx

    # Attempt at fixing OSX tomfoolery
    export ARCHFLAGS="-arch x86_64"

    # set vim as pager for manual
    export MANPAGER='col -bx | vim -c ":set ft=man nonu nolist" -R -'
    ;;
  'Linux')
    keychain id_rsa id_dsa
    . ~/.keychain/`uname -n`-sh
esac

# enable vi command line editing mode
#set -o vi

# shortcut to vim
alias :e=vim

# add path to all my useful script and binary directories
export PATH=$HOME/bin:$HOME/xbin:$PATH

# load up my git-enabled prompt
source git_prompt
# load up bash completion scripts from other people
source git-completion.bash
source git-flow-completion.bash

# load up my rails helper functions and aliases
source rails_helpers

# ssh public key agent code
#SSHAGENT=/usr/bin/ssh-agent
#SSHAGENTARGS="-s"
#if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
#   eval `$SSHAGENT $SSHAGENTARGS` > /dev/null
#   trap "kill $SSH_AGENT_PID" 0
#fi
#ssh-add ~/.ssh/id_rsa

# searches for given string in filenames in current and all subdirectories
function s { find . -nowarn -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -nowarn -name "$1" 2>/dev/null; }

# ls with showall, colors, and /'s after directories
alias ls="ls -AFhxX --color --group-directories-first "
#alias l="ls"
alias ll="ls -A -XSx -l"
alias lk="ls -gGhLXS"

# makes sure bash knows it's dealing with a color terminal-emulator and sets the colors for ls
# LSCOLORS is BSD/OSX format, LS_COLORS is linux format
export CLICOLOR=1

# grep customizations
alias grep='grep -Hns --binary-files=without-match --color'
function gr { grep -R $1 $2./*; }
function grr { grep -R $*; }

function rg { find . -name '*.*rb' -exec grep "$*" {} \; -print; }

# diff with unified format (why use anything else?!)
alias diff='diff -U3'

# replace this with a util that allows real directory history navigation
alias cx='pushd'
alias cz='popd'

# prints out the ps header and then displays all processes matching the given argument
function psg { ps -A | awk 'NR==1; /'$1'/&&!/awk/'; }

# spell checker
function spell { echo $@|aspell -a; }

# Quick bash.org
#bashorg () { lynx -dump "www.bash.org?$1" | less; }

export PAGER=vimless
#export MANPAGER=vimman
alias less=$PAGER

# sooo many letters to type in a day, here's a few less for the history command
alias h='history'
# bash history shit, removes dups, increases size, and saves on shell exit
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

