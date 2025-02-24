" VimPlug format plugin loading
call plug#begin('~/.vim/bundle')

" deps
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" background
Plug 'godlygeek/csapprox'

" interface
Plug 'airblade/vim-gitgutter'
" https://github.com/nvim-telescope/telescope-media-files.nvim " has lots of external deps
Plug 'nathanaelkane/vim-indent-guides' " show tab depths
Plug 'mbbill/undotree'          " allow you to navigate undo branches
Plug 'lilydjwg/colorizer'       " display colors in their color like #FF0
"Plug 'terryma/vim-multiple-cursors'
"Plug 'NeogitOrg/neogit'         " interactive git history explorer
"Plug 'junegunn/limelight.vim'      " only syntax highlight a portion of the document to make it easier to focus
"Plug 'junegunn/goyo'           " distraction free mode for vim
Plug 'nvim-zh/colorful-winsep.nvim' " highlight the active window like tmux does

" statusline / tabline / bufferline / windowline / commandline / etc
Plug 'nvim-lualine/lualine.nvim' " lua featureful but fast statusline
Plug 'b0o/incline.nvim'          " floating pane labels, ideal for global statuslines
"Plug 'willothy/nvim-cokeline'    " customizable bufferline framework
"Plug 'gorbit99/codewindow.nvim' " a colorized minimap using braille characters
"Plug 'MunifTanjim/nui.nvim'     " UI component library, used by noice
"Plug 'nvim-notify'              " fancy notifications for plugins
"Plug 'folke/noice.nvim'         " completely overhaul the Vim commandline experience
"Plug 'houtsnip/vim-emacscommandline' " better navigation for the Vim commandline
"Plug 'gelguy/wilder.nvim'            " improve suggestions for the Vim commandline
Plug 'nanozuki/tabby.nvim'

" file / buffer navigation
Plug 'ctrlpvim/ctrlp.vim'       " fallback for features Telescope lacks, probably removed soon
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.*' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'crispgm/telescope-heading.nvim'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'PhilippFeO/telescope-filelinks.nvim'
Plug 'jvgrootveld/telescope-zoxide' " Telescope integration for zoxide
Plug 'Zane-/cder.nvim'           " Telescope plugin to change Vim's CWD/PWD
Plug 'AckslD/nvim-neoclip.lua'   " Telescope plugin to interact with the clipboard
"Plug 'gbprod/yanky.nvim'         " Similar to NeoClip above
"Plug 'Xuyuanp/yanil'             " a file explorer
"Plug 'nvim-neo-tree/neo-tree.nvim' " a file explorer

" lsp
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
"Plug 'Saghen/blink.cmp'         " "beta quality" completion plugin for LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " does parsing and stuff

" completion
"Plug 'scrooloose/syntastic'     " integration with language features, although it's not been working well
"Plug 'ervandew/supertab'        " better tab completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'

" diagnostics
Plug 'folke/trouble.nvim'

" macros
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpopt/vim-abolish'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'euclidianAce/BetterLua.vim'
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
Plug 'ollykel/v-vim'

" tools
"Plug 'edkolev/promptline'
Plug 'edkolev/tmuxline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'epwalsh/obsidian.nvim', { 'tag': '*' }

call plug#end()
