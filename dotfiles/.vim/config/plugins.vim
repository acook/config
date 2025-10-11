" VimPlug plugin specification
" for vanilla VIM
call plug#begin('~/.vim/bundle')

" background
Plug 'vim-scripts/guicolorscheme.vim'  " assist with loading Gvim color schemes in terminal mode
Plug 'godlygeek/csapprox'              " assist with loading Gvim color schemes in terminal mode
Plug 'drmikehenry/vim-fontdetect'
"Plug 'vim-scripts/colorsupport.vim'    " assist with loading Gvim color schemes in terminal mode

" interface
Plug 'tpope/vim-fugitive'              " git integration, run git commands with :Git
Plug 'airblade/vim-gitgutter'          " show repo status info for affected lines in gutter
Plug 'nathanaelkane/vim-indent-guides' " show tab depths
Plug 'mbbill/undotree'                 " allow you to navigate undo branches
"Plug 'mg979/vim-visual-multi'          " multi-cursor in normal mode
"Plug 'junegunn/limelight.vim'          " only syntax highlight a portion of the document to make it easier to focus
"Plug 'junegunn/goyo'                   " distraction free mode for vim
Plug 'KabbAmine/vCoolor.vim'           " invoke GUI color pickers on multiple platforms

" statusline / tabline / bufferline / windowline / commandline / etc
"Plug 'houtsnip/vim-emacscommandline'   " better navigation for the Vim commandline
Plug 'itchyny/lightline.vim'           " simple statusline

" file / buffer navigation
Plug 'ctrlpvim/ctrlp.vim'             " fuzzy search and completion
Plug 'ivalkeen/vim-ctrlp-tjump'       " fuzzy search tags with ctrl-p :CtrlPtjump
"Plug 'scrooloose/nerdtree'
" WIKI
Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'

" completion
Plug 'ervandew/supertab'              " better tab completion
Plug 'tpope/vim-endwise'              " automatically add end-style keywords

" diagnostics
"Plug 'scrooloose/syntastic'           " syntax and error checker (deprecated)
Plug 'dense-analysis/ale'             " recommended replacement for Syntastic

" macros
"Plug 'christoomey/vim-tmux-navigator'     " navigate between tmux and vim panes seamlessly
"Plug 'scrooloose/nerdcommenter'           " comment and uncomment lines with a command
Plug 'tpope/vim-commentary'               " comment and uncomment lines with a command
Plug 'tpope/vim-abolish'                  " perform multiple matches and gsubs at once
Plug 'tpope/vim-repeat'                   " allows plugins to integrate with the . command
Plug 'tpope/vim-surround'                 " maipulate enclosing quotes and brackets
"Plug 'tpope/vim-unimpaired'               " adds normal mode commands that are like inverse versions of existing commands, for consistency and ergonomics
Plug 'tpope/vim-eunuch'                   " perform shell-like commands :Remove :Move and :SudoWrite
Plug 'tpope/vim-characterize'             " displays extra info about characters under the cursor when using ga
"Plug 'chrisbra/unicode.vim'               " search for Vim digraphs for Unicode characters
"Plug 'maxbrunsfeld/vim-yankstack'
Plug 'AndrewRadev/bufferize.vim'          " evaluate a Vim/Ex command and stores its output in a buffer

" colorschemes
Plug 'tomasr/molokai'
"Plug 'p8952/vim-colors-wombat'
"Plug 'XRDX/vim-color'
"Plug 'croaker/mustang-vim'
"Plug 'mitsuhiko/fruity-vim-colorscheme'
Plug 'jaromero/vim-monokai-refined'
"Plug 'lsdr/monokai'
"Plug 'sickill/vim-monokai'
Plug 'benjaminwhite/Benokai'
"Plug 'rickharris/vim-monokai'
"Plug 'vim-scripts/vibrantink'
"Plug 'tpope/vim-vividchalk'

" syntax
"Plug 'lilydjwg/colorizer'                 " changes the color of hex codes into the color they represent, like #FF0
Plug 'BourgeoisBear/clrzr'                " as above, maybe faster, but less compatible
"Plug 'euclidianAce/BetterLua.vim'         " supposed to improve Lua syntax hiliting, but it is old
Plug 'fatih/vim-go'
Plug 'rhysd/vim-crystal'
Plug 'zaiste/tmux.vim'
Plug 'slim-template/vim-slim'
Plug 'rust-lang/rust.vim'
"Plug 'lambdatoast/elm.vim'
"Plug 'parkr/vim-jekyll'
Plug 'cespare/vim-toml'
"Plug 'fasterthanlime/ooc.vim'
Plug 'dag/vim-fish'
Plug 'tpope/vim-git'
"Plug 'tpope/vim-haml'
"Plug 'tpope/vim-rails'
"Plug 'emezeske/manpageview'
"Plug 'evanmiller/nginx-vim-syntax'
"Plug 'littleq0903/vim-nginx'
Plug 'Prosumma/vim-rebol'
Plug 'elixir-editors/vim-elixir'
Plug 'isobit/vim-caddyfile'
Plug 'ollykel/v-vim'
Plug 'vim-pandoc/vim-pandoc'               " supports markdown and a lot of other formats and embeds, but tends to be buggy
Plug 'vim-pandoc/vim-pandoc-syntax'        " pandoc should be activated last in case it needs a syntax file

" tools
"Plug 'edkolev/promptline.vim'              " generates shell prompts using Vim colors
"Plug 'edkolev/tmuxline.vim'                " generates tmux statuslines using Vim colors
"Plug 'editorconfig/editorconfig-vim'       " editorconfig integration, Vim now ships with it

call plug#end()
