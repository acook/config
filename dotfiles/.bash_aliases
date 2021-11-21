#!/bin/bash

# shortcut to vim
alias :e=vim

# alias less to whatever we set out pager to
if [[ -n $PAGER ]]; then
  alias less="$PAGER"
fi

# Homebrew has broken ls, here we try to fix it
if [[ -n $(command -v gls) ]]; then
  LSPATH="gls"
else
  LSPATH="ls"
fi

# ls with showall, colors, and /'s after directories
alias ls="$LSPATH -AFhxX --color --group-directories-first "
#alias ll="ls -A -XSx -l"
alias ll='$LSPATH -alF'
alias lk="$LSPATH -gGhLXS"
alias l='$LSPATH -CF'

# searches for given string in filenames in current and all subdirectories
function s { find . -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -name "$1" 2>/dev/null; }

# grep customizations
alias grep='grep -Hns --binary-files=without-match --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
function gr { grep -R "$1" "$2./*"; }
function grr { grep -R "$@"; }

# diff with unified format (why use anything else?!)
alias diff='diff -U3'

# replace this with a util that allows real directory history navigation
alias cx='pushd'
alias cz='popd'

# prints out the ps header and then displays all processes matching the given argument
function psg { ps -A | awk 'NR==1; /'"$1"'/&&!/awk/'; }

# spell checker
function spell { echo "$@" | aspell -a; }

# sooo many letters to type in a day, here's a few less for the history command
alias h='history'

# runs rspec tests with the $DEBUG flag set to true
alias rspec_debug="bundle exec ruby -d -r 'rspec/autorun' -I './lib' spec/*_spec.rb"

# Add an "alert" alias for long running commands. Use semicolor to execute it in sequence
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# If there's an ack-grep command, alias it to ack
if [[ -n $(command -v ack-grep) ]]; then
  alias ack='ack-grep'
fi

# Uses fzf and fd to search for directories inside of a git repo
cdg() {
    local GIT_ROOT
    local DIR
    GIT_ROOT="$(git rev-parse --show-toplevel)"
    DIR="$(fd --type d --hidden --follow --exclude .git . "$GIT_ROOT" | fzf -q "$*" -1)"
    echo "$DIR"
    cd "${DIR:-.}"
}
