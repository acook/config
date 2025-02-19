

# For https://github.com/PatrickF1/fzf.fish

# Delete the fzf plugin's ctrl-r replacement, I like the default one better.
# Ideally, I would modify fzf to behave closer to the default one,
# but I don't know if I can make it properly syntax hilite commands or not.
#
# This makes the fzf version available on alt+ctrl+r instead.

if type -q fzf_configure_bindings
  fzf_configure_bindings --history=\e\cr
end

# tell the fzf plugin to prioritize filenames
set -x fzf_directory_opts --scheme=path
