function load_directory {

  local source_dir=$1
  local command=$2
  local files=`ls $source_dir`

  for filename in $files; do
    echo Running $filename...
    source $filename

    if [[ $command ]]; then
      echo Running $command callback...
      if command_exists $command; then
        $command
        unset -f $command
      else
        echo Error: Callback function "$command" not found in $filename
      fi
    fi
  done
}
