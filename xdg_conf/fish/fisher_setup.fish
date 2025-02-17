set --query _fisher_path_initialized && exit
set --global _fisher_path_initialized

set --universal --export fisher_path "$(xdgconf)/fisher"

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

fisher -v > /dev/null

if status --is-interactive
  set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]

  for f in $fisher_path/conf.d/*.fish
    #echo -e "\e[31mloading: $f\e[0m"
    if test -f "$f"
      source "$f"
    end
  end
end

