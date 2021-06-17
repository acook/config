# fish-shell post install

function post_install {
  local filename=fish
  local source_dir="$dot_dir"
  local target_dir="$HOME/.config"

  mkdir -p "$target_dir"
  cd "$target_dir"

  if symlink_exists $target_dir/$filename; then
    echo -ne "rm: symlink "
    rm -v "$target_dir/$filename"
  fi

  backup_and_link "$filename" "$source_dir" "$target_dir" "$backup_dir"
}
