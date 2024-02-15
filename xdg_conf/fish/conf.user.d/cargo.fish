if test -d "$HOME/.cargo/bin"
  fapid "$HOME/.cargo/bin"
end

# these applications are configured here because they may be installed by this package manager

if type -q bat
  set MANPAGER "bat --language man --style=plain"
end

function rg
  command rg --no-messages $argv
end
