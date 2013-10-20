source ~/.user-setup/antigen/antigen.zsh

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
antigen theme https://gist.github.com/6879576.git agnoster

# Tell antigen that you're done.
antigen apply

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
