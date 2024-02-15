#!/usr/bin/env fish
# rebuild PATH from scratch due to various messy reasons
set -e PATH
fapid "/usr/local/bin"
fapid "/bin"
fapid "/sbin"
fapid "/usr/bin"
fapid "/usr/sbin"
fapid "$HOME/.local/bin"
fapid "$HOME/bin"
fapid "$HOME/xbin"

set -l FISHCONFIGDIR (realpath (status dirname))

switch (osinfo.bash | read -L)
  case osx
    # insert any macos specific changes
  case linux
    fapid -a "/opt/local/bin"

    function ls
      command ls -AFhxX --color --group-directories-first $argv
    end
  case '*'
    echo "unknown os detected"
end

# load all files in my secondary config directory (away from fisher's mess)
if status --is-interactive
  for f in $FISHCONFIGDIR/conf.user.d/*
    if test -f "$f"
      source "$f"
    end
  end
end

setdefault LOCAL_FISH_CONFIG ~/.local.config.fish

if test -e $LOCAL_FISH_CONFIG
  source $LOCAL_FISH_CONFIG
end
