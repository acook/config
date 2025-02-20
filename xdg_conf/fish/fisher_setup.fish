function _set_fisher_paths
  set --query _fisher_path_initialized && return
  set --global _fisher_path_initialized

  set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
  set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
end
_set_fisher_paths

set --universal --export fisher_path "$(xdgconf)/fisher"

source "$fisher_path/functions/fisher.fish"

if status --is-interactive
  for f in $fisher_path/conf.d/*.fish
    if test -f "$f"
      source "$f"
    end
  end
end

