function backup_and_link {

  filename="$1"
  source_dir="$2"
  target_dir="$3"
  backup_dir="$4"

  if symlink_exists "$target_dir/$filename"; then
    echo -ne "rm: symlink "
    rm -v "$target_dir/$filename"
  elif file_exists "$target_dir/$filename"; then
    echo -ne "mv: file "
    mv -v "$target_dir/$filename" "$backup_dir/"
  elif directory_exists "$target_dir/$filename"; then
    echo -ne "mv: directory "
    mv -v "$target_dir/$filename" "$backup_dir/"
  fi

  echo -ne "ln: "
  ln -vs "$source_dir/$filename" "$target_dir/$filename"
}
