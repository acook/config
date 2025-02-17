function xdgconf
  set --local xdgpath "$XDG_CONFIG_HOME"

  if test -z "$xdgpath"
    set --local path "$HOME/.config"
  end

  echo "$xdgpath"
end
