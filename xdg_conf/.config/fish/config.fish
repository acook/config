set -gx PATH \
  $HOME/bin $HOME/xbin /opt/local/bin \
  $HOME/.rbenv/shims $HOME/.rbenv/bin \
  $HOME/.nimble/bin \
  $HOME/.cargo/bin \
  $HOME/go/bin \
  /sbin /bin /usr/sbin /usr/bin /snap/bin

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

# for hydro prompt
set hydro_color_error ff00af
set hydro_color_git ff00af
set hydro_color_prompt afff00
