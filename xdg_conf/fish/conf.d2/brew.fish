#!/usr/bin/env fish

if test -e /home/linuxbrew/.linuxbrew/bin/brew
  # on linux
  env SHELL=fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
else if test -e /opt/homebrew/bin/brew
  # on ARM macos
  env SHELL=fish /opt/homebrew/bin/brew shellenv | source
else if test -e /usr/local/bin/brew
  # on Intel macos
  env SHELL=fish /usr/local/bin/brew shellenv | source
end

if type -q brew
  # Ensure that the Homebrew prefix variable is set
  if not set -q HOMEBREW_PREFIX
    set -gx HOMEBREW_PREFIX (brew --prefix)
  end

  if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
  end

  if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
  end

  switch (osinfo.bash | read -L)
    case osx
      fapid -p "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
      fapid "$HOMEBREW_PREFIX/opt/llvm/bin"
  end
else
  warn " -- WARNING: homebrew not detected"
end
