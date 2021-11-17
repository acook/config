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

# for hydro prompt
set hydro_color_error ff00af
set hydro_color_git ff00af
set hydro_color_prompt afff00

# for pure prompt
set -g async_prompt_functions _pure_prompt_git
set pure_color_danger #ff00af
set pure_color_primary #afff00
set pure_color_success #1f51ff
#FF6700

# for tide prompt
set tide_status_color 1f51ff
set tide_status_bg_color_failure ff00af
set tide_status_color_failure white
set tide_pwd_bg_color afff00
set tide_pwd_color_anchors 000000
set tide_pwd_color_dirs black
set tide_pwd_color_truncated_dirs aa8888
set tide_git_bg_color_urgent ff00af
set tide_git_bg_color 1f51ff
set tide_git_bg_color_unstable FF6700

