set modelines=0
set nomodeline

" XDG_CONFIG_HOME may not always be set
if len($XDG_CONFIG_HOME) == 0
  let xdg = "~/.config"
else
  let xdg = "$XDG_CONFIG_HOME"
endif

" prepare plugin settings
source $HOME/.vim/config/plugin_setup.vim
" specify plugins to load
let $plugd = "" . xdg . "/nvim/plugins.vim"
source $plugd

" load directory of additional configs
let $rd = expand(xdg . '/nvim/rd.d/\*\*/\*.vim')
runtime $rd

let color = "molokai"
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : 'italic', 'sp' : 'fg' }
execute "colorscheme" color
"Makes background the default, so it can be transparent in terminals that
"support it. Everything will be unreadable if the terminal is light!
highlight Normal ctermbg=NONE

set noshowmode                                                                  "Don't show modes since the statusline already does that
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set gdefault                                                                    "Set global flag for search and replace
set cursorline                                                                  "Highlight current line
set hlsearch
set incsearch
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set encoding=utf-8
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set nowrap                                                                      "Disable word wrap by default
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:│\ ,trail:·                                                   "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set hidden                                                                      "Keep buffers undo history when :q
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --smart-case\ --color=never\ --no-heading\ -H\ -n\ --column     "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=300                                                              "Cursor hold timeout
set undofile                                                                    "Keep undo history across sessions, by storing in file
set noswapfile                                                                  "Disable creating swap file
set fillchars+=vert:│                                                           "Use vertical line for vertical split
set cindent
set breakindent                                                                 "Preserve indent on line wrap
set smartindent                                                                 "Use smarter indenting
set autoindent
set expandtab                                                                   "Use spaces for indentation
set tabstop=2
set shiftwidth=2                                                                "Use 2 spaces for indentation
set foldmethod=syntax                                                           "When folding enabled, use syntax method
set foldminlines=3
set foldlevel=100
set diffopt+=vertical                                                           "Always use vertical layout for diffs

set scrolloff=3                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=3
set sidescroll=5
set pyxversion=3                                                                "Always use python 3
let g:python3_host_prog = '/usr/bin/python3'


" increase the default command line history
set history=1000

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of
" ambiguity.
set wildmode=list:longest

" Make clipbord work on OS X. This makes copy/paste operations trivial between
" vim and other applications since they all use the same clipboard now.
if $TMUX == ''
  set clipboard+=unnamed
endif

" visual select automatically copies to..
" Linux - X11's selection ("middle click") buffer when available
" OSX   - System clipboard
set go+=a

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

highlight Pmenu ctermbg=238 gui=bold

" set the spellcheck language
setlocal spell spelllang=en_us
" disable spellcheck by default
set nospell

" for exuberant CTags support
set tags=./tags;/

" use a user-local vim-specific directory for backups rather than the global
" tmp directory by default
set backupdir=~/.tmp,/tmp,/var/tmp,./.backup
set directory=~/.tmp,/tmp,/var/tmp,./.backup

" treat question marks as part of a word in ruby
autocmd BufRead *.rb,*.rake,*.rhtml,<ruby> set isk=?,@,48-57,_,192-255

" nginx.conf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" disable wordwrap when looking at CSVs
autocmd BufRead *.csv,*.csv*,<csv> set nowrap

" remove whitespace at end of line
func! StripTrailingWhitespace()
  if &modifiable && ! &bin
    call execute('%s/\s\+$//e')
  endif
endfunc
" automatically run before write, except binary files
autocmd BufWritePre * call StripTrailingWhitespace()

" show changes since last save
if !exists(":DiffOrig")
    command DiffOrig vert new | set buftype=nofile | read # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" send selection to clipboard
func! Clip() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| system-clipboard')
endfunction

augroup vimrc
  autocmd!
  autocmd InsertEnter * set nocul                                               "Remove cursorline highlight
  autocmd InsertLeave * set cul                                                 "Add cursorline highlight in normal mode
  autocmd FocusGained,BufEnter * silent! exe 'checktime'                        "Refresh file when vim gets focus
  autocmd FileType vim inoremap <buffer><silent><C-Space> <C-x><C-v>
  autocmd FileType markdown setlocal spell
  autocmd FileType json setlocal equalprg=python\ -m\ json.tool
augroup END

" leader shortcuts START -->

" Paste without moving the cursor, great for pasting something at the
" beginning of different lines
"map <C-p> p`[

" visual mode copy to system clipboard
vmap <leader>y <esc>:'<,'>:w ! system-clipboard<CR>
" normal mode paste from system clipboard
nmap <leader>p <esc>:r ! system-clipboard -r<CR>

" runs diff against the current buffer and the file on disk
map <leader>d :w !diff % -<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

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

" Buffer navigation
"nnoremap <C-tab> :bn<CR>
"nnoremap <C-S-tab> :bp<CR>
"nnoremap <C-~> :b#<CR>

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
