" for testing different rgb mappings for colors
"let rgb_file = "~/.vim/rgb.txt"

" don't worry about trying to stick to vi/ex conventions
set nocompatible

" This is for the Syntastic plugin, we need to set it before it loads
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" configure CtrlP
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

" initialize pathogen and load all the plugins in .vim/bundle
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

" Configure Vimwiki
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_user_mouse=1
let g:vimwiki_folding=1
let g:vimwiki_fold_lists=1
let g:vimwiki_list_ignore_newline=0
let wiki_1 = {}
let wiki_1.nested_syntaxes = {'python': 'python', 'ruby': 'ruby', 'rails': 'rails', 'yaml': 'yml'}

" Configure 256 color schemes for GUI or Terminal using CSApprox or
" guicolorscheme, depending on conditions
if has('gui_running')
  colorscheme wombat256mod
elseif version >= 700 && &term != 'cygwin'
  set t_Co=256
  if has('gui')
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
    colorscheme wombat256mod
  else
    GuiColorScheme wombat256mod
  endif
endif

" Disable broken ri popup
if has("balloon_eval")
  set noballooneval
end

" for MacVim
if has("macunix")
  set transparency=8
end

" for Gui versions of vim :help guioptions
set guioptions=aAce

" Enable syntax hilighting
syntax on

" Syntax hilight based on filetype, which is autmatically determined.
" The filetype plugin needs to be reinitilized because of pathogen
filetype off
filetype on
filetype plugin on
filetype indent on

" Enable syntax folding for blocks and comments.
set foldmethod=syntax
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

" The current buffer can be put to the background without writing to disk;
" When a background buffer becomes current again marks and undo-history are
" remembered.
" This also means file buffers are still "open" in vim when you :q them.
set hidden

" Open new windows on the bottom or right instead of the top and left.
set splitbelow
set splitright

" Make the command and search history frickin' huge
set history=1000

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of
" ambiguity.
set wildmode=list:longest

" Show line numbers
set number

" Make clipbord work on OS X. This makes copy/paste operations trivial between
" vim and other applications since they all use the same clipboard now.
set clipboard=unnamed
" visual select automatically copies to X11's selection ("middle click") buffer
set go+=a

" scrolls the buffer before you reach the last line of the window
set scrolloff=3

" text search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" for exhuberant CTags support
set tags=./tags;/

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
set title
autocmd BufEnter * let &titlestring = "vim: " . expand("%:p:~")
"autocmd BufEnter * exe "echo '\033'+bufname("%")+'\007'"

" sets backspace key functions, allows it to backspace over end of line
" characters, start of line, and indentation
set backspace=indent,eol,start
" movement keys will take you to the next or previous line
set whichwrap+=<,>,h,l

" enable mouse in console
set mousemodel=extend
set mouse=a

" shortcuts
" for rails.vim alternate between test and tested
map <leader>t <Esc>:A
map <leader>ts <Esc>:AS
map <leader>tv <Esc>:AV
" foe rails.vim swap to model/control/etc from associated file
map <leader>rm <Esc>:Rmodel<CR>
map <leader>rc <Esc>:Rcontroller<CR>
map <leader>rh <Esc>:Rhelper<CR>
map <leader>ru <Esc>:Runittest<CR>
map <leader>rf <Esc>:Rfunctionaltest<CR>
map <leader>ro <Esc>:Robserver<CR>
map <leader>rv <Esc>:Rview<CR>
map <leader>rl <Esc>:Rlocale<CR>
" for CtrlP
map <leader>ff <Esc>:CtrlP<CR>
map <leader>fb <Esc>:CtrlPBuffer<CR>
map <leader>ft <Esc>:CtrlPTag<CR>
map <leader>fq <Esc>:CtrlPQuickFix<CR>
map <leader>fd <Esc>:CtrlPDir<CR>
map <leader>fr <Esc>:CtrlPRTS<CR>
map <leader>fm <Esc>:CtrlPMRU<CR>
" for gundo
map <leader>g <Esc>:GundoToggle<CR>
" runs diff against the current buffer and the file on disk
map <leader>d <Esc>:w !diff % -<CR>
" search hilighting control, enables and disable intelligently and toggles
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>/ :set hlsearch!<CR>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make mouse scrolling work in vim!!!
:map <M-Esc>[62~ <ScrollWheelUp>
:map! <M-Esc>[62~ <ScrollWheelUp>
:map <M-Esc>[63~ <ScrollWheelDown>
:map! <M-Esc>[63~ <ScrollWheelDown>
:map <M-Esc>[64~ <S-ScrollWheelUp>
:map! <M-Esc>[64~ <S-ScrollWheelUp>
:map <M-Esc>[65~ <S-ScrollWheelDown>
:map! <M-Esc>[65~ <S-ScrollWheelDown>

" make keypad work in vim with iTerm on OS X!
:map <Esc>Oq 1
:map <Esc>Or 2
:map <Esc>Os 3
:map <Esc>Ot 4
:map <Esc>Ou 5
:map <Esc>Ov 6
:map <Esc>Ow 7
:map <Esc>Ox 8
:map <Esc>Oy 9
:map <Esc>Op 0
:map <Esc>On .
:map <Esc>OQ /
:map <Esc>OR *
:map <kPlus> +
:map <Esc>OS -
:map! <Esc>Oq 1
:map! <Esc>Or 2
:map! <Esc>Os 3
:map! <Esc>Ot 4
:map! <Esc>Ou 5
:map! <Esc>Ov 6
:map! <Esc>Ow 7
:map! <Esc>Ox 8
:map! <Esc>Oy 9
:map! <Esc>Op 0
:map! <Esc>On .
:map! <Esc>OQ /
:map! <Esc>OR *
:map! <kPlus> +
:map! <Esc>OS -

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Spell Check with ctrl+T
"map <leader>s
"map ^S:w!<CR>:!aspell check %<CR>:e! %<CR>
" set the spellcheck language
setlocal spell spelllang=en_us
" disable spellcheck by default since it annoys me
set nospell

" creates a new :Shell command that works like :! but opens the result in a
" new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

" statusline tweaks
set ls=2 " Always show status line
if has('statusline')
  " Status line detail:
  " %f     file path
  " %y     file type between braces (if defined)
  " %([%R%M]%)   read-only, modified and modifiable flags between braces
  " %{'!'[&ff=='default_file_format']}
  "        shows a '!' if the file format is not the platform
  "        default
  " %{'$'[!&list]}  shows a '*' if in list mode
  " %{'~'[&pm=='']} shows a '~' if in patchmode
  " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
  "        only for debug : display the current syntax item name
  " %=     right-align following items
  " #%n    buffer number
  " %l/%L,%c%V   line number, total number of lines, and column number
  function SetStatusLineStyle()
    if &stl == '' || &stl =~ 'synID'
      let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=%{SyntasticStatuslineFlag()} #%n %l/%L,%c%V "
    else
      let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
    endif
  endfunc
  " Switch between the normal and vim-debug modes in the status line
  nmap _ds :call SetStatusLineStyle()<CR>
  call SetStatusLineStyle()
  " Window title
  if has('title')
    set titlestring=%t%(\ [%R%M]%)
  endif
endif

" use a user-local vim-specific directory for backups rather than the global
" tmp directory by default
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" lets you navigate logic constructs with the % key
runtime macros/matchit.vim

" For Project.vim
":let g:proj_flags="imstvcg"

" for NERDTree.vim
"set winfixwidth

