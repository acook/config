#!/usr/bin/env zsh

if [[ -a ~/.user-setup ]]; then
  USER_SETUP=~/.user-setup
elif [[ -a ~/.user_setup ]]; then
  USER_SETUP=~/.user_setup
else
  echo "No user-setup directory found, don't forget to download antigen."
fi

source $USER_SETUP/antigen/antigen.zsh

#exec 2>> ~/zsh_trace.txt
#set -x

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Enhanced integrated search (history/git/ack/etc)
antigen bundle zsh-users/zaw
# Configure ZAW http://blog.patshead.com/2013/04/more-powerful-zsh-history-search-using-zaw.html
#bindkey '^R' zaw-history
#bindkey -M filterselect '^R' down-line-or-history
#bindkey -M filterselect '^S' up-line-or-history
#bindkey -M filterselect '^E' accept-search
#zstyle ':filter-select:highlight' matched fg=green
#zstyle ':filter-select' max-lines 3
zstyle ':filter-select' case-insensitive yes # enable case-insensitive
zstyle ':filter-select' extended-search yes # see below

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme https://gist.github.com/6879576.git agnoster

# Tell antigen that you're done.
antigen apply

# overwrite with generated prompt when available
source ~/promptline.theme

# get rid of the whitespace to the right of the RPROMPT
# If it casues issues (scrolling when prompt is last line) then try this:
# http://www.zsh.org/mla/workers/2013/msg01176.html
ZLE_RPROMPT_INDENT=0

# set_window_title and PWD command helpers
source ~/bin/prompt_helpers

# update window title with directory
function precmd {
  set_window_title $(PWD);
}

# update window title with command
function preexec {
  commandline="$1" # the user-entered commandline is passed in as first arg
  args=${${(z)commandline}[2,-1]} # get command's args
  new_title=${args:-$(PWD)} # if no args, then use the pwd
  set_window_title $new_title
}

# load standard aliases
source ~/.bash_aliases

export DEFAULT_USER='acook'

export PATH=~/bin:~/xbin:$PATH

# OS-specific configuration
case $(uname) in
  ('Darwin')        # OSX

    # Add up Homebrew's Python binary directory to the path
    export PATH=/usr/local/share/python:$PATH

    # Give precedence to user/local/bin because that's where Homebrew installs their stuff
    export PATH=/usr/local/sbin:$PATH
    export PATH=/usr/local/bin:$PATH

    # Add homebrew commandline completion file
    completion_file="$(brew --prefix)/Library/Contributions/brew_bash_completion.zsh"
    if [ -f $completion_file ]; then
      source $completion_file
    fi

  ;;
esac

# For RVM
unsetopt auto_name_dirs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
__rvm_project_rvmrc

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# prompt ideas
# ~/.rvm/bin/rvm-prompt v p g
# http://lostechies.com/derickbailey/2010/11/24/my-osx-terminal-prompt-reposted-from-tumblr/
# http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#
