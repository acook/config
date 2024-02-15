#!/usr/bin/env fish
# rebuild PATH from scratch due to various messy reasons
set -e PATH
fapid "/usr/local/bin"
fapid "/bin"
fapid "/sbin"
fapid "/usr/bin"
fapid "/usr/sbin"
fapid "$HOME/bin"
fapid "$HOME/xbin"

set -l FISHCONFIGDIR (realpath (status dirname))

switch (osinfo.bash | read -L)
  case osx
    # insert any macos specific changes
  case linux
    fapid -a "/opt/local/bin"
  case '*'
    echo "no os detected"
end

fapid "$HOME/.rbenv/bin"
if type -q rbenv
  status --is-interactive; and rbenv init - fish | source
  fapid "$HOME/.rbenv/shims"
  fapid "$HOME/.rbenv/bin"
end

fapid "$HOME/.nimble/bin"
fapid "$HOME/.cargo/bin"
fapid "$HOME/go/bin"
fapid "/usr/local/share/python"
fapid "$HOME/.local/bin"

# same as "search string"
# except that it matches substrings as well
function s
  ss "*$argv[1]*" $argv[2]
end

# "search string" in filename in directory
# expects the filename to match the search string exactly
function ss
  if test -z $argv[2]
    set dir "."
  else
    set dir $argv[2]
  end

  command find "$dir" -name "$argv[1]" 2>/dev/null
end

function ls
  command ls -AFhxX --color --group-directories-first $argv
end

function rg
  command rg --no-messages $argv
end

# helpers

function setdefault --no-scope-shadowing
    set -q $argv[1] || set $argv[1] $argv[2..-1]
end

if type -q bat
  set MANPAGER "bat --language man --style=plain"
end

for f in $FISHCONFIGDIR/conf.d2/*
  if test -f "$f"
    source "$f"
  end
end

setdefault LOCAL_FISH_CONFIG ~/.local.config.fish

if test -e $LOCAL_FISH_CONFIG
  source $LOCAL_FISH_CONFIG
end
