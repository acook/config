#!/bin/bash

# Platform-specific setups
unamestr=$(uname)
case $unamestr in
  'Darwin')        # OSX
    # increase the maximum number of files each shell can handle
    ulimit -S -n 2048

    # Give precedence to homebrew's version of the GNU utils
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

    # Give precedence to user/local/bin because that's where Homebrew installs their stuff
    export PATH=/usr/local/sbin:/usr/local/bin:$PATH

    # Path extension for Brew's version of LLVM utils
    export PATH=$PATH:/usr/local/opt/llvm/bin

    # I can set alias ls=ls_osx if gnu coreutils are not installed
    alias ls_osx="ls -p -F -G -h"
    # Colorize OSX's ls
    export LSCOLORS=hxdxDxGxbxfxFxBxBxHxHx

    # Attempt at fixing OSX tomfoolery
    export ARCHFLAGS="-arch x86_64"

    # Tell compiler to use multiple cores
    export MAKEFLAGS="-j$(sysctl hw.ncpu | cut --delimiter=' ' -f 2)"

    # set vim as pager for manual
    #export MANPAGER='col -bx | vim -c ":set ft=man nonu nolist" -R -'

    if [[ -f $(brew --prefix)/etc/bash-completion ]]; then
      source "$(brew --prefix)/etc/bash-completion"
    fi

    brew_completions="$(brew --prefix)/Library/Contributions/brew_bash_completion.sh"
    # load homebrew bash completion file
    if [[ -f $brew_completions ]]; then
      source "$brew_completions"
    fi

    git_completions="$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
    # load git completions
    if [[ -f $git_completions ]]; then
      source "$git_completions"
    fi

    # Load iTerm integration if available
    test -e "$HOME/.iterm2_shell_integration.bash" && source "$HOME/.iterm2_shell_integration.bash"

    ;;

  'Linux')
    if [[ -n $(command -v keychain) ]]; then
      keychain id_rsa
      source "$HOME/.keychain/$(uname -n)-sh"
    fi

    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

    # Give precedence to /opt/local/bin since that's where I install my hand compiled stuff
    export PATH=/opt/local/bin:$PATH

    #export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    #  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    #  -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    #  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
esac

export EDITOR=vim

# Handle potential pagers
if [[ -n $(command -v vimpager) ]]; then
  export PAGER=vimpager
else
  if [[ -n $(command -v vimless) ]]; then
    export PAGER=vimless
  fi
  if [[ -n $(command -v vimman) ]]; then
    export MANPAGER=vimman
  fi
fi

# enable vi command line editing mode
#set -o vi

# add path to all my useful script and binary directories
export PATH=$HOME/bin:$HOME/xbin:$PATH

# for ooc programming
export OOC_LIBS="$HOME/Projects/OOC:/usr/local/Cellar/rock/HEAD"

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# load up my git-enabled prompt
source git_prompt

# makes sure bash knows it's dealing with a color terminal-emulator and sets the colors for ls
# LSCOLORS is BSD/OSX format, LS_COLORS is linux format
export CLICOLOR=1

# Generate colors for GNU's ls
eval "$(dircolors ~/.dir_colors)"

# bash history shit, removes dups, increases size, and saves on shell exit
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Load RVM if available - some aliases can cause this to fail on some systems so we load it before them
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# tune Ruby GC
#export RUBY_GC_MALLOC_LIMIT=60000000
#export RUBY_FREE_MIN=200000
# Use high performance allocators like jemalloc and tcmalloc
#export LD_PRELOAD=/usr/lib64/libtcmalloc_minimal.so.0.1.0

# load up aliases and functions
source ~/.bash_aliases
# If there's a custom per-machine file available load it up too
[[ -s "$HOME/.bash_profile.local" ]] && source ~/.bash_profile.local
