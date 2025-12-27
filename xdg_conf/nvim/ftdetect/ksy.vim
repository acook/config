" ftdetect/ksy.vim
" via https://github.com/yut23/neovim-homeshick/blob/f3a502eef802fe8b55240130ed5ce02ecde85b55/home/.config/nvim/ftdetect/ksy.vim

" vint: -ProhibitAutocmdWithNoGroup
" According to :h ftdetect, the augroup is set before this file is sourced.

" use YAML syntax for Kaitai Struct files
autocmd BufRead,BufNewFile *.ksy setfiletype yaml
