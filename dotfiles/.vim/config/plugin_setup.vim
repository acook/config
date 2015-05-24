" This is for the Syntastic plugin, we need to set it before it loads
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" configure CtrlP
let g:ctrlp_map = ''
let g:ctrlp_max_height = 45
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_mruf_include = '\.py$\|\.rb$|\.coffee|\.haml'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git/', 'cd %s && git ls-files'],
      \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" configure CtrlPtjump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" configure IndentGuides plugin
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size  = 1
autocmd! VimEnter,Colorscheme * hi IndentGuidesOdd ctermbg=236 guibg=#303030 | hi IndentGuidesEven ctermbg=239 guibg=#505050
autocmd BufRead * IndentGuidesEnable

" configure airline, enable fancy symbols
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=0
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1 " Rainbow parentheses'!

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

