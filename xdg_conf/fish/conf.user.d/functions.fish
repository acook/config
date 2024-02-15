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

# usage: setdefault <varname> <fallback>
function setdefault --no-scope-shadowing
    set -q $argv[1] || set $argv[1] $argv[2..-1]
end
