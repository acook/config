function backup_and_link {

  local filename="$1"
  local source_dir="$2"
  local target_dir="$3"
  local backup_dir="$4"

  if file_missing "$backup_dir"; then
    mkdir -p -v "$backup_dir"
  fi

  if broken_symlink "$target_dir"; then
    echo -ne "rm: symlink of target dir "
    rm -v "$target_dir"
  fi

  if file_missing "$target_dir"; then
    echo -ne "mkdir: creating missing target dir "

    # for whatever reason, mkdir -v may not report any changes, even if it makes them
    # this was noted to happen on macos Big Sur
    local mkdir_output="$(mkdir -p -v "$target_dir")"
    local mkdir_report="${mkdir_output:-$target_dir}"

    echo "$mkdir_report"
  fi

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
