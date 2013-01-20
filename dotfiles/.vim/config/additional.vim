" treat question marks as part of a word in ruby
autocmd BufRead *.rb,*.rake,*.rhtml,<ruby> set isk=?,@,48-57,_,192-255

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" disable wordwrap when looking at CSVs
autocmd BufRead *.csv,*.csv*,<csv> set nowrap

" remove whistespace at end of line before write
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
au BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" display the file name of the current file in the Terminal (xterm/item/&c) title
if has('title')
  set title
  autocmd BufEnter * let &titlestring = "vim: " . expand("%:p:~")
  "set titlestring=%t%(\ [%R%M]%)
  "autocmd BufEnter * exe "echo '\033'+bufname("%")+'\007'"
endif
