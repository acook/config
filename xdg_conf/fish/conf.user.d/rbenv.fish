if test -d "$HOME/.rbenv/bin"
  fapid "$HOME/.rbenv/bin"
end

if type -q rbenv
  status --is-interactive; and rbenv init - --no-rehash fish | source
end
