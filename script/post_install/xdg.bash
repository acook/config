# sets up the ~/.config and ~/.local paths

function post_install {

  echo "Setting up XDG paths..."

  local shared_backup_dir="$backup_dir"

  local source_dir="$dir/xdg_conf"
  local target_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
  local backup_dir="$shared_backup_dir/.config"

  backup_and_link_directory "$source_dir" "$target_dir" "$backup_dir"

  local source_dir="$dir/xdg_data"
  local target_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
  local backup_dir="$shared_backup_dir/.local/share"

  backup_and_link_directory "$source_dir" "$target_dir" "$backup_dir"

}
