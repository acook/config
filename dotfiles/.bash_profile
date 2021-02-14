#!/bin/bash

# For configurations that are specific to a given platform
PLATFORM="$(uname)"
case $PLATFORM in
  'Darwin')

    # increase the maximum number of files each shell can handle
    ulimit -S -n 2048

    # For macOS native (non GNU) ls command: set defaults and enable colors
    alias ls_osx="ls -p -F -G -h"
    export CLICOLOR=1
    export LSCOLORS=hxdxDxGxbxfxFxBxBxHxHx

    # Attempt at fixing macOS compiler confusion (may not be necessary any more?)
    export ARCHFLAGS="-arch x86_64"

    # Tell compiler to use the name number of threads as there are cores in the system
    [[ -n $(command -v gcut) ]] && alias cut="gcut"
    MAKEFLAGS="-j$(sysctl hw.ncpu | cut --delimiter=' ' -f 2)"
    export MAKEFLAGS

    # Only do the rest of this if we detect that Homebrew is installed
    if [[ -n $(command -v brew) ]]; then
      # Ensure that the Homebrew prefix variable is set
      export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix)}"

      # Give precedence to where Homebrew installs their binaries
      PATH=$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/libexec/gnubin:$PATH:$HOMEBREW_PREFIX/opt/llvm/bin

      # Load all available Homebrew completion scripts
      for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*; do
        [[ -s $COMPLETION ]] && source "$COMPLETION"
      done

      # Load Homebrew base bash completion script
      COMPLETION=$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
      if [[ -s $COMPLETION ]]; then
        source "$COMPLETION"
      fi
    fi

    # Load iTerm integration if available
    ITERM="$HOME/.iterm2_shell_integration.bash"
    if [[ -s $ITERM ]]; then
      source "$ITERM"
    fi

  ;;
  'Linux')

    if [[ -n $(command -v keychain) ]]; then
      keychain id_rsa
      source "$HOME/.keychain/$(uname -n)-sh"
    fi

    JAVA_HOME="$(readlink -f /usr/bin/java | sed "s:bin/java::")"
    export JAVA_HOME

    # Give precedence to /opt/local/bin since that's where I install my hand compiled stuff
    export PATH=/opt/local/bin:$PATH

  ;;
esac

# Only save one copy of a command
export HISTCONTROL=erasedups
# Store more commands than default
export HISTSIZE=10000
# Save the history file on exit
shopt -s histappend

# Add user's bin directories to PATH
PATH=$HOME/bin:$HOME/xbin:$PATH

# Use VS Code or Vim whenever we need an editor, this affects `git commit`
if [[ -n $(command -v code) ]]; then
  export EDITOR=code
elif [[ -n $(command -v vim) ]]; then
  export EDITOR=vim
fi

# Load Git-enabled prompt if available, if not then set a basic default
GIT_PROMPT="$HOME/bin/git_prompt"
if [[ -s $GIT_PROMPT ]]; then
  source "$GIT_PROMPT"
else
  export PS1="\[\e[35m\]\W\[\e[m\] \[\e[36m\]\\$\[\e[m\] "
fi

# Configure colors for GNU's ls
[[ -n $(command -v gdircolors) ]] && alias dircolors="gdircolors"
[[ -s "$HOME/.dir_colors" ]] && eval "$(dircolors "$HOME/.dir_colors")"

# Enable bash's programmable completion features
COMPLETION="/etc/bash_completion"
if [[ -s $COMPLETION ]] && ! shopt -oq posix; then
  source "$COMPLETION"
fi

# Load up the default SSH key
if [[ -n $(command -v ssh-agent) ]]; then
  eval "$(ssh-agent -s)"
  ssh-add "$HOME/.ssh/id_rsa"
fi

# Handle potential Ruby version managers
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  # Load rbenv if available (preferred)
  PATH="$PATH:$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
elif [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Load RVM if available
  # Aliases can cause this to fail on some systems so we load it first
  source "$HOME/.rvm/scripts/rvm"
fi

# Source machine-specific configurations if available
[[ -s "$HOME/.bash_profile.local" ]] && source "$HOME/.bash_profile.local"

# Source aliases if they exist
# This should be loaded towards the end due to potential conflicts
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
