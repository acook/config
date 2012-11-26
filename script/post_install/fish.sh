# fish-shell post install

function post_install {
  local filename=fish
  local source_dir="$dot_dir"
  local target_dir="$HOME"

  cd "$target_dir"
  mkdir .config
  cd .config

  if symlink_exists $target_dir/fish; then
    echo -ne "rm: symlink "
    rm -v "$target_dir/fish"
  fi

  backup_and_link $filename "$source_dir" "$target_dir" "$backup_dir"
}
