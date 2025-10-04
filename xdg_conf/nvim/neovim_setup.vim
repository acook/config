" this is for anything that needs to be run once-ish when setting up NeoVim on a new profile

" in particular Mason, which doesn't seem to support a configuration file
" so you have to install packages each time by running commands
" if you put it in your config it will re-do this every startup
" no good solution is forthcoming

" to actually install packages on a user profile, this script needs to be sourced

" i hate this so much

" https://github.com/v-analyzer/v-analyzer
:MasonInstall v-analyzer
