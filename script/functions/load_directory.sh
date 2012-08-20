function load_directory {

  local source_dir=`cd $1; pwd`
  cd $source_dir

  if [ ${2:-} ]; then
    local command=$2
  else
    local command=''
  fi

  local files=`ls -1 -A $source_dir`

  for filename in $files; do
    source "$filename"

    if [[ $command ]]; then
      if function_exists $command; then
        echo "-- Running $command callback from \"$filename\"..."
        $command
        unset -f $command
      else
        echo "Error: Callback function \"$command\" not found in $filename"
      fi
    fi
    cd $source_dir
  done
}
