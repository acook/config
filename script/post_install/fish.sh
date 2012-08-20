# fish-shell post install

function post_install {
  local source_dir=$dot_dir/fish

  echo source_dir: $source_dir
  echo target_dir: $target_dir
  echo backup_dir: $backup_dir

  cd "$target_dir"
  mkdir .config
  cd .config

  if symlink_exists $target_dir/fish; then
    echo -ne "rm: symlink "
    rm -v "$target_dir/fish"
  fi

  backup_and_link "$source_dir" "`pwd`" "$backup_dir"
}
