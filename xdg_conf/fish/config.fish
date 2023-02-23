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

switch (osinfo.bash | read -L)
  case osx
    if type -q brew
      # Ensure that the Homebrew prefix variable is set
      if not set -q HOMEBREW_PREFIX
        set -gx HOMEBREW_PREFIX (brew --prefix)
      end

      # Give precedence to where Homebrew installs their binaries
      fapid "$HOMEBREW_PREFIX/sbin"
      fapid "$HOMEBREW_PREFIX/bin"
      fapid -p "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
      fapid "$HOMEBREW_PREFIX/opt/llvm/bin"
    else
      warn " -- WARNING: homebrew not detected"
    end
  case linux
    fish_add_path -a "/opt/local/bin"
end

status --is-interactive; and rbenv init - fish | source

fapid "$HOME/.rbenv/shims"
fapid "$HOME/.rbenv/bin"
fapid "$HOME/.nimble/bin"
fapid "$HOME/.cargo/bin"
fapid "$HOME/go/bin"
fapid "/usr/local/share/python"

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

setdefault LOCAL_FISH_CONFIG ~/.local.config.fish

if test -e $LOCAL_FISH_CONFIG
  source $LOCAL_FISH_CONFIG
end
