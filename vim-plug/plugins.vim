call plug#begin('~/.config/nvim/autoload/plugged')
    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'lewis6991/gitsigns.nvim'

    " Tree sitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'p00f/nvim-ts-rainbow' " Rainbow parenthesis
    Plug 'nvim-treesitter/playground' " For checking the curent token, getting all tokens etc...
    
    " Better syntax support
	Plug 'sheerun/vim-polyglot'

	" File explorer
	Plug 'scrooloose/NERDTree'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
    
    Plug 'dracula/vim'
    Plug 'joshdick/onedark.vim' 

    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    
    " ============================ coc ============================
    " Stable version of coc
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Keeping up to date with master
    " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc-eslint'
    " ============================ coc ============================
    
    " status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter' 
    Plug 'pangloss/vim-javascript'
    
    " For Tab line
    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'moll/vim-bbye'

    " For Multiple Cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'Johan-Liebert1/nvcode-color-schemes.vim'
    
    " Black formatter
    Plug 'ambv/black'    

    " LSP
    Plug 'neovim/nvim-lspconfig' " enable LSP
    Plug 'williamboman/nvim-lsp-installer' " simple to use language server installer
call plug#end()
