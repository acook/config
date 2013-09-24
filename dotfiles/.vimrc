" for testing different rgb mappings for colors
"let rgb_file = "~/.vim/rgb.txt"

" don't worry about trying to stick to vi/ex conventions
set nocompatible

" disable modelines, as I don't use them
set modelines=0
set nomodeline

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

" configure airline, enable fancy symbols
let g:airline_theme='powerlineish'
let g:airline_inactive_collapse=0
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_linecolumn_prefix = ' '
let g:airline#extensions#branch#symbol = ' '
let g:airline#extensions#readonly#symbol = ''
let g:airline#extensions#paste#symbol = 'ℙ'

" initialize pathogen and load all the plugins in .vim/bundle
runtime bundle/plugin-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1 " Rainbow parentheses'!

if has('gui_running')

  colorscheme monokai_modified

  " for Gui versions of vim. see :help guioptions for more info
  set guioptions=aAce

  if fontdetect#hasFontFamily("Menlo for Powerline")
    set guifont=Menlo\ for\ Powerline\ 10
  elseif fontdetect#hasFontFamily("Droid Sans Mono")
    set guifont=Droid\ Sans\ Mono\ 10
  elseif fontdetect#hasFontFamily("Andale Mono")
    set guifont=Andale\ Mono\ 10
  elseif fontdetect#hasFontFamily("DejaVu Sans Mono")
    set guifont=DejaVu\ Sans\ Mono\ 10
  end

  " for MacVim GUI version
  if has("macunix")
    " make the background partially transparent
    set transparency=4
  end

elseif version >= 700 && &term != 'cygwin'

  " configure 256 color schemes for terminal using CSApprox or guicolorscheme
  set t_Co=256
  if has('gui')
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
    colorscheme monokai_modified
  else
    runtime! bundle/plugin-guicolorscheme/plugin/guicolorscheme.vim
    GuiColorScheme monokai_modified
  endif

endif

" for all MacVims
if has("macunix")
  " allow the usage of the option key
  set macmeta
end

" disable balloon popup since theres a plugin that makes it really annoying
if has("balloon_eval")
  set noballooneval
  set balloondelay=100000
end

" Syntax highlight based on filetype, which is autmatically determined.
syntax on
" The filetype plugin needs to be reinitialized after enabling syntax.
filetype off
filetype on
filetype plugin on
filetype indent on

" Enable syntax folding for blocks and comments.
set foldmethod=syntax
" Don't fold blocks less than 3 lines long.
set foldminlines=3
set foldlevel=100

" indentation configuration
set cindent
set smartindent
set autoindent

" Convert tabs to spaces, use 2 spaces in place of tabs.
set expandtab
set tabstop=2
set shiftwidth=2

" text search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" hide buffers instead of closing them when you :q, keeping their undo history
set hidden

" Open new windows on the bottom and right instead of the top and left.
set splitbelow
set splitright

" increase the default command line history
set history=1000

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of
" ambiguity.
set wildmode=list:longest

" Show line numbers
set number

" for non-tmux environs
if $TMUX == ''
  " Make clipbord work on OS X. This makes copy/paste operations trivial between
  " vim and other applications since they all use the same clipboard now.
  set clipboard=unnamed
end

" visual select automatically copies to..
" Linux - X11's selection ("middle click") buffer when available
" OSX   - System clipboard
set go+=a

" scrolls the buffer before you reach the last line of the window
set scrolloff=3

" Always show status line
set laststatus=2

" default encoding
set encoding=utf-8

" sets backspace key functions, allows it to backspace over end of line
" characters, start of line, and indentation
set backspace=indent,eol,start
" movement keys will take you to the next or previous line
set whichwrap+=<,>,h,l

" enable mouse in console
set mousemodel=extend
set mouse=a
set mousehide

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" set the spellcheck language
setlocal spell spelllang=en_us
" disable spellcheck by default
set nospell

" for exuberant CTags support
set tags=./tags;/

" use a user-local vim-specific directory for backups rather than the global
" tmp directory by default
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" treat question marks as part of a word in ruby
autocmd BufRead *.rb,*.rake,*.rhtml,<ruby> set isk=?,@,48-57,_,192-255

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" nginx.conf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" disable wordwrap when looking at CSVs
autocmd BufRead *.csv,*.csv*,<csv> set nowrap

" remove whitespace at end of line
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
" automatically run before write, except binary files
autocmd BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" display the file name of the current file in the Terminal (xterm/item/&c) title
if has('title')
  set title
  autocmd BufEnter * let &titlestring = "vim: " . expand("%:p:~")
  "set titlestring=%t%(\ [%R%M]%)
  "autocmd BufEnter * exe "echo '\033'+bufname("%")+'\007'"
endif

" leader shortcuts START -->

" for rails.vim alternate between test and tested
map <leader>t  :A<CR>
map <leader>ts :AS<CR>
map <leader>tv :AV<CR>
" for rails.vim swap to model/control/etc from associated file
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rh :Rhelper<CR>
map <leader>ru :Runittest<CR>
map <leader>rf :Rfunctionaltest<CR>
map <leader>ro :Robserver<CR>
map <leader>rv :Rview<CR>
map <leader>rl :Rlocale<CR>

" for CtrlP
map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <leader>ft :CtrlPTag<CR>
map <leader>fq :CtrlPQuickFix<CR>
map <leader>fd :CtrlPDir<CR>
map <leader>fr :CtrlPRTS<CR>
map <leader>fm :CtrlPMRU<CR>

" for undotree
map <leader>u :UndotreeToggle<CR>
" for backward compatibility
map <leader>g :UndotreeToggle<CR>

" runs diff against the current buffer and the file on disk
map <leader>d :w !diff % -<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

" <-- leader shortcuts END

" search hilighting control, enables and disable intelligently and toggles
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>/ :set hlsearch!<CR>

" tab navigation like web browsers
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <ESC>:tabprevious<CR>i
imap <C-tab> <ESC>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" quickly move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make mouse scrolling work in terminal vim!
map <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[65~ <S-ScrollWheelDown>

" make external keypad work in terminal vim OSX!
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -

