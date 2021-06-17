" This is for the Syntastic plugin, we need to set it before it loads
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" configure YouCompleteMe, to interoperate with SuperTab
" auto close the completion window
"let g:ycm_autoclose_preview_window_after_completion = 1
" only use the `Down` key to select the first item
"let g:ycm_key_list_select_completion = ['<Down>']

" configure CtrlP
let g:ctrlp_map = ''
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$' }
"let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files'],
  \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
  \ }
\ }
let g:ctrlp_by_filename = 1 " ctrl-d to toggle

" configure CtrlPtjump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" configure IndentGuides plugin
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size  = 1
autocmd! VimEnter,Colorscheme * hi IndentGuidesOdd ctermbg=236 guibg=#303030 | hi IndentGuidesEven ctermbg=239 guibg=#505050
autocmd BufRead * IndentGuidesEnable

" configure lightline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'mode': 'LightlineMode',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
\ }

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1 " Rainbow parentheses'!

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Pandoc
let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby", "rebol", "clojure", "elixir", "bash=sh", "c"]

