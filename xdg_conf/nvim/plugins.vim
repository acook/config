" VimPlug plugin specification
" for NEOVIM
call plug#begin()

" deps
Plug 'nvim-lua/plenary.nvim'           " a lua function library for Vim, used by other lua plugins like Obsidian.nvim
Plug 'kyazdani42/nvim-web-devicons'    " plugins use this to identify colors and names of icons from Nerd Fonts collection

" background
Plug 'godlygeek/csapprox'              " assist with loading Gvim color schemes in terminal mode

" interface
Plug 'tpope/vim-fugitive'              " git integration, run git commands with :Git
"Plug 'airblade/vim-gitgutter'          " show repo status info for affected lines in gutter
Plug 'lewis6991/gitsigns.nvim'         " show repo status info for affected lines in gutter
Plug 'nathanaelkane/vim-indent-guides' " show tab depths
Plug 'mbbill/undotree'                 " allow you to navigate undo branches
"Plug 'mg979/vim-visual-multi'          " multi-cursor in normal mode
"Plug 'NeogitOrg/neogit'                " interactive git history explorer
"Plug 'junegunn/limelight.vim'          " only syntax highlight a portion of the document to make it easier to focus
"Plug 'junegunn/goyo'                   " distraction free mode for vim
Plug 'nvim-zh/colorful-winsep.nvim'    " highlight the active window pane like tmux does
Plug 'KabbAmine/vCoolor.vim'           " invoke GUI color pickers on multiple platforms

" statusline / tabline / bufferline / windowline / commandline / etc
Plug 'nvim-lualine/lualine.nvim'       " lua featureful but fast statusline
Plug 'b0o/incline.nvim'                " floating pane labels, ideal for global statuslines
Plug 'nanozuki/tabby.nvim'             " tabline
"Plug 'willothy/nvim-cokeline'          " customizable bufferline framework
Plug 'gorbit99/codewindow.nvim'        " a colorized minimap using braille characters
"Plug 'MunifTanjim/nui.nvim'            " UI component library, used by noice
"Plug 'nvim-notify'                     " fancy notifications for plugins
"Plug 'folke/noice.nvim'                " completely overhaul the Vim commandline experience
"Plug 'houtsnip/vim-emacscommandline'   " better navigation for the Vim commandline
"Plug 'gelguy/wilder.nvim'              " improve suggestions for the Vim commandline
"Plug 'rebelot/heirline.nvim'           " possible replacement for lualine

" file / buffer navigation
Plug 'ctrlpvim/ctrlp.vim'              " fallback for features Telescope lacks, probably removed soon
"Plug 'ivalkeen/vim-ctrlp-tjump'        " fuzzy search tags with ctrl-p :CtrlPtjump
Plug 'pjkack/vim-ctrlp-tjump'          " fuzzy search tags with ctrl-p :CtrlPtjump (fork)
Plug 'fisadev/vim-ctrlp-cmdpalette'    " add a command palette to make searching and running commands easier
Plug 'mattn/ctrlp-matchfuzzy'          " use Vim's builtin fuzzy matcher for ctrlp
"Plug 'gbprod/yanky.nvim'               " Similar to NeoClip above
"Plug 'nvim-neo-tree/neo-tree.nvim'     " a file explorer
"Plug 'vijaymarupudi/nvim-fzf'          " batteries included fuzzy finder built on fzf, may replace Telescope
" TELESCOPE
Plug 'nvim-telescope/telescope.nvim'   " pop-up fuzzy search
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'crispgm/telescope-heading.nvim'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'PhilippFeO/telescope-filelinks.nvim'
Plug 'jvgrootveld/telescope-zoxide' " Telescope integration for zoxide
Plug 'Zane-/cder.nvim'           " Telescope plugin to change Vim's CWD/PWD
Plug 'AckslD/nvim-neoclip.lua'   " Telescope plugin to interact with the clipboard
" WIKI
Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'
Plug 'epwalsh/obsidian.nvim', { 'tag': '*' }

" lsp
Plug 'williamboman/mason.nvim'            " package manager for LSP
Plug 'neovim/nvim-lspconfig'              " LSP configurations
Plug 'williamboman/mason-lspconfig.nvim'  " integration between Mason and LSPconfig
Plug 'ray-x/lsp_signature.nvim'           " tooltip with LSP info
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " does parsing and stuff

" completion
"Plug 'ervandew/supertab'                  " better tab completion (compatible with vanlla vim)
Plug 'hrsh7th/cmp-nvim-lsp'               " cmp source for LSP
Plug 'hrsh7th/cmp-buffer'                 " cmp source for words in buffers, required by cmp-cmdline
Plug 'hrsh7th/cmp-path'                   " cmp source for file paths
" Plug 'petertriho/cmp-git'                " cmp source for git
Plug 'hrsh7th/cmp-cmdline'                " completion for command line and search
Plug 'hrsh7th/vim-vsnip'                  " snippets, required by nvim-cmp
Plug 'hrsh7th/nvim-cmp'                   " extensible completion plugin
"Plug 'Saghen/blink.cmp'                   " extensible completion plugin
"Plug 'nvimtools/none-ls.nvim'             " inject LSP diagnostics (i think something else uses this??)
"Plug 'ZhiyuanLck/smart-pairs'             " automatically add closing quotes and brackets, buggy??
"Plug 'RRethy/nvim-treesitter-endwise'     " supposed to be like tpope's but faster, buggy! empty early lines in a Lua file will cause errors
Plug 'tpope/vim-endwise'                  " automatically add end-style keywords

" diagnostics
Plug 'folke/trouble.nvim'                 " like a superset of quickfix and similar lists
"Plug 'scrooloose/syntastic'               " syntax and error checker (deprecated)
Plug 'dense-analysis/ale'                 " recommended replacement for Syntastic

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
Plug 'chrisbra/unicode.vim'               " search for Vim digraphs for Unicode characters
"Plug 'maxbrunsfeld/vim-yankstack'
Plug 'AndrewRadev/bufferize.vim'          " evaluate a Vim/Ex command and stores its output in a buffer

" colorschemes
Plug 'tomasr/molokai'

" syntax
"Plug 'lilydjwg/colorizer'                 " changes the color of hex codes into the color they represent, like #FF0
"Plug 'BourgeoisBear/clrzr'                " as above, maybe faster, but less compatible
Plug 'norcalli/nvim-colorizer.lua'        " changes the color of hex codes into the color they represent, like #FF0, lua
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
Plug 'Prosumma/vim-rebol'                  " Vim actually ships with Rebol2 support, but this is for Rebol3
Plug 'elixir-editors/vim-elixir'
Plug 'isobit/vim-caddyfile'
Plug 'ollykel/v-vim'
"Plug 'vim-pandoc/vim-pandoc'               " supports markdown and a lot of other formats and embeds, but tends to be buggy
"Plug 'vim-pandoc/vim-pandoc-syntax'        " pandoc should be activated last in case it needs a syntax file

" tools
"Plug 'edkolev/promptline.vim'              " generates shell prompts using Vim colors
"Plug 'edkolev/tmuxline.vim'                " generates tmux statuslines using Vim colors
"Plug 'editorconfig/editorconfig-vim'       " editorconfig integration, NeoVim supplies its own Lua version

call plug#end()
