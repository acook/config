function fapid -d "Add path to PATH if dir exists"
  # "fish add path if dir"
  # the fish_add_to_path internal function seems broken,
  # it always replaces instead of appending/prepending entries
  # this does pretty much the same thing

  argparse 'p/prepend' 'a/append' 'v/verbose' 'h/help' -- $argv
  or return 255

  if set -q _flag_help
    echo "fapid - Add path to PATH if dir exists"
    echo ""
    echo "usage: fapid path/to/add [-p|-a|-v]"
    echo ""
    echo -e "\t-p --prepend\tadd path to beginning"
    echo -e "\t-a --append\tadd path to end (default)"
    echo -e "\t-v --verbose\toutput command it runs and if dir missing"
    echo -e "\t-h --help\tthis help"
    return
  end

  # set --local will make the variable go out of scope outside the if
  if set -q _flag_append
    set _fapid_opts "a"
  else if set -q _flag_prepend
    set _fapid_opts "p"
  else
    set _fapid_opts "a"
  end

  set -l path $argv[1]

  if contains -- $path $PATH
    if set -q _flag_verbose
      warn "$path already in PATH!"
    end
    return
  end

  if test -d $path
    set -l cmd 'set -gx'"$_fapid_opts"' PATH '"$path"
    if set -q _flag_verbose
      warn $cmd
    end
    eval $cmd
  else
    if set -q _flag_verbose
      warn "$path not found!"
    end
  end
end

