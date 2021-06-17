function backup_and_link_directory {

  local source_dir=$1
  local target_dir=$2
  local backup_dir=$3

  echo
  echo linking dir
  echo source_dir: $source_dir
  echo target_dir: $target_dir
  echo backup_dir: $backup_dir

  mkdir -v "$backup_dir"
  local files=`ls -A -1 $source_dir`

  for filename in $files; do
    backup_and_link "$filename" "$source_dir" "$target_dir" "$backup_dir"
  done

}
