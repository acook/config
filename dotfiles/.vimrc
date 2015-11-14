" don't worry about trying to stick to vi/ex conventions
set nocompatible

" disable modelines, as I don't use them
set modelines=0
set nomodeline

" prepare plugin settings
source $HOME/.vim/config/plugin_setup.vim
" specify plugins to load
source $HOME/.vim/config/plugins.vim

let color = "molokai"

if has('gui_running')

  execute "colorscheme" color

  " for Gui versions of vim. see :help guioptions for more info
  set guioptions=aAce

  " for MacVim GUI version
  if has("macunix")
    " make the background partially transparent
    set transparency=4

    " allow the usage of the option key
    set macmeta

    " Macvim seems to address fonts differently than normal Gvim
    if fontdetect#hasFontFamily("Meslo LG S DZ for Powerline")
      set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12
    elseif fontdetect#hasFontFamily("Menlo for Powerline")
      set guifont=Menlo\ for\ Powerline:h12
    elseif fontdetect#hasFontFamily("Droid Sans Mono")
      set guifont=Droid\ Sans\ Mono:h12
    elseif fontdetect#hasFontFamily("DejaVu Sans Mono")
      set guifont=DejaVu\ Sans\ Mono:h12
    elseif fontdetect#hasFontFamily("Andale Mono")
      set guifont=Andale\ Mono:h12
    end

  else

    if fontdetect#hasFontFamily("Meslo LG S DZ for Powerline")
      set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline\ 11
    elseif fontdetect#hasFontFamily("Menlo for Powerline")
      set guifont=Menlo\ for\ Powerline\ 11
    elseif fontdetect#hasFontFamily("Droid Sans Mono")
      set guifont=Droid\ Sans\ Mono\ 11
    elseif fontdetect#hasFontFamily("DejaVu Sans Mono")
      set guifont=DejaVu\ Sans\ Mono\ 11
    elseif fontdetect#hasFontFamily("Andale Mono")
      set guifont=Andale\ Mono\ 11
    end

  end

elseif version >= 700 && &term != 'cygwin'

  " force 256 color mode
  set t_Co=256

  " configure 256 color schemes for terminal using CSApprox or guicolorscheme
  if has('gui') || v:version > 703
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : 'italic', 'sp' : 'fg' }
    execute "colorscheme" color
  else
    execute "GuiColorScheme" color
  endif

endif

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

" disable wrap by default
set nowrap

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

" highlight the line and line number the cursor is on
set cursorline

" highlight the column the cursor is in
"set cursorcolumn

" colorize right margin (slightly darker in gvim, slightly lighter in console)
highlight ColorColumn ctermbg=234 guibg=#181a1b
let &colorcolumn=join(range(81,400),",")

" highlight characters over 120 the same as errors
match ErrorMsg '\%>120v.\+'

" Make clipbord work on OS X. This makes copy/paste operations trivial between
" vim and other applications since they all use the same clipboard now.
if $TMUX == ''
  set clipboard+=unnamed
endif

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
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

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

" show changes since last save
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" send selection to clipboard
func! Clip() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| system-clipboard put')
endfunction

" visual mode copy to system clipboard
vmap <leader>y <esc>:'<,'>:w ! system-clipboard put<CR>
" normal mode paste from system clipboard
nmap <leader>p <esc>:r ! system-clipboard get<CR>

" display the path and file name of the current fila
" in the Terminal's Window/Tab Title
if has('title')
  " %(  - item group .. %)
  " .20 - truncate path at 20 chars
  " %{  - eval this .. }
  " %   - file path (see :help expand)
  " :~  - reduce home dir to tilde
  " :.  - relative paths
  " :h  - parent dir only
  " :s  - search and replace modifier
  " ;   - arbitrary seperator character
  " $   - pattern: end of string
  " /   - substitute: trailing slash (if string not empty)
  " %<  - truncate from here
  " %t  - file name (tail/basename)
  " %r  - read only flag
  " %m  - modified flag
  " see :help statusline/titlestring for more info
  set titlestring=%.20(%{expand(\"%:~:.:h:s;$;/;\")}%<%t%(%r%m%)%)

  " For xtermish Window Title protocols
  " Also names tmux's panes
  set t_ts=]0;
  set t_fs=

  " for renaming tmux windows to "vim"
  "set t_ts=kvim\\]0;

  set title
endif


" leader shortcuts START -->

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

" runs diff against the current buffer and the file on disk
map <leader>d :w !diff % -<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

" <-- leader shortcuts END

" search hilighting control, enables and disable intelligently and toggles
noremap / :set hlsearch<CR>/
noremap ? :set hlsearch<CR>?
noremap n :set hlsearch<CR>n
noremap N :set hlsearch<CR>N
noremap <CR> :noh<CR><CR>
noremap <leader>/ :set hlsearch!<CR>

" tab navigation
map  <C-t>     :tabnew<CR>
map  <S-tab>   :tabnext<CR>
map  <C-tab>   :tabnext<CR>
map  <C-S-tab> :tabprevious<CR>
map! <C-t>     <ESC>:tabnew<CR>
map! <S-tab>   <ESC>:tabnext<CR>i
map! <C-tab>   <ESC>:tabnext<CR>i
map! <C-S-tab> <ESC>:tabprevious<CR>i

" Bash like keys for the command line and insert mode
noremap! <C-A> <Home>
noremap! <C-E> <End>
noremap! <C-K> <ESC><S-d>i
noremap! ƒ <S-RIGHT>
noremap! ∫ <S-LEFT>

" quickly move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

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
map <Esc>OM <CR>
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
map! <Esc>OM <CR>
