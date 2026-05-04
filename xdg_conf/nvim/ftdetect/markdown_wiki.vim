" ftdetect/markdown_wiki.vim
" Created: 2025-04-25
" Author: Anthony M. Cook
"
" allows `gf` normal/visual command to work with wikilinks
" NOTE: only works with existing files in the current path or that have their
" relative/absolute path specified
autocmd FileType markdown set suffixesadd=.md,.markdown
