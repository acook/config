" VimPlug format plugin loading
call plug#begin('~/.vim/bundle')

" background
Plug 'godlygeek/csapprox'

" interface
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'       " consider https://github.com/junegunn/fzf.vim
Plug 'itchyny/lightline.vim'    " this might be neat to add https://github.com/mengelbrecht/lightline-bufferline
Plug 'nathanaelkane/vim-indent-guides' " show tab depths
"Plug 'ervandew/supertab'        " better tab completion
Plug 'mbbill/undotree'          " allow you to navigate undo branches
Plug 'lilydjwg/colorizer'       " display colors in their color like #FF0
"Plug 'terryma/vim-multiple-cursors'
"Plug 'sjbach/lusty'            " a better file explorer
"Plug 'scrooloose/nerdtree'     " another file explorer
"Plug 'gregsexton/gitv'
"Plug 'junegunn/limelight'      " only syntax highlight a portion of the document to make it easier to focus
"Plug 'junegunn/goyo'           " distraction free mode for vim

" deps
Plug 'nvim-lua/plenary.nvim'

" completion
"Plug 'scrooloose/syntastic'     " integration with language features, although it's not been working well
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'

" diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

" macros
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpopt/vim-abolish'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-eunuch'
"Plug 'Townk/vim-autoclose'
"Plug 'maxbrunsfeld/vim-yankstack'

" extensions
Plug 'ivalkeen/vim-ctrlp-tjump'

" colorschemes
Plug 'tomasr/molokai'

" syntax
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
"Plug 'tpope/vim-markdown'                 " doesn't actually work that well, use pandoc
"Plug 'tpope/vim-rails'
"Plug 'emezeske/manpageview'
"Plug 'evanmiller/nginx-vim-syntax'
"Plug 'littleq0903/vim-nginx'
Plug 'Prosumma/vim-rebol'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'        " pandoc should be activated last in case it needs a syntax file
Plug 'isobit/vim-caddyfile'

" tools
"Plug 'edkolev/promptline'
Plug 'edkolev/tmuxline.vim'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
