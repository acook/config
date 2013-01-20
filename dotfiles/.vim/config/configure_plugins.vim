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

" Configure Vimwiki
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_user_mouse = 1
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list_ignore_newline = 0
let wiki_1 = {}
let wiki_1.nested_syntaxes = {'python': 'python', 'ruby': 'ruby', 'rails': 'rails', 'yaml': 'yml'}

" configure IndentGuides plugin
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size  = 1
autocmd! VimEnter,Colorscheme * hi IndentGuidesOdd ctermbg=236 guibg=#303030 | hi IndentGuidesEven ctermbg=239 guibg=#505050
autocmd BufRead * IndentGuidesEnable
"autocmd! VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=123 guibg=#880055

" configure Powerline symbols
let g:Powerline_symbols = 'unicode'

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1 " Rainbow parentheses'!

