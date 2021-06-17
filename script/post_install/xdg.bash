# sets up the ~/.config and ~/.local paths

function post_install {

  local shared_backup_dir="$backup_dir"

  local source_dir="$dir/xdg_conf"
  local target_dir="$HOME/.config"
  local backup_dir="$shared_backup_dir/.config"

  backup_and_link_directory "$source_dir" "$target_dir" "$backup_dir"

  local source_dir="$dir/xdg_data"
  local target_dir="$HOME/.local"
  local backup_dir="$shared_backup_dir/.local"

  backup_and_link_directory "$source_dir" "$target_dir" "$backup_dir"

}
