function findbin
  set find find
  set mode /111

  if set -q argv[1]
    set dir $argv[1]
  else
    set dir '.'
  end

  if set -q argv[2..]
    set cmd '-exec' $argv[2..] \;
  end

  if test (uname) = Darwin
    if command -v gfind > /dev/null 2>&1; then
      set find gfind
    else
      set mode +111
    end
  end

  $find $dir -maxdepth 3 -type f -perm $mode $cmd
  # To generate symlinks to all the executables found pass this in after the search path:
  # ln -s -v -f {} "target_dir"
end
