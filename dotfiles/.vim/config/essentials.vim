" for testing different rgb mappings for colors
"let rgb_file = "~/.vim/rgb.txt"

" don't worry about trying to stick to vi/ex conventions
set nocompatible

" Syntax hilight based on filetype, which is autmatically determined.
" The filetype plugin needs to be reinitialized
syntax on
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

" Make clipbord work on OS X. This makes copy/paste operations trivial between
" vim and other applications since they all use the same clipboard now.
set clipboard=unnamed
" visual select automatically copies to X11's selection ("middle click") buffer
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
