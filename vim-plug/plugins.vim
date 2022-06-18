call plug#begin('~/.config/nvim/autoload/plugged')
    " Tree sitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    
    " Better syntax support
	Plug 'sheerun/vim-polyglot'

	" File explorer
	Plug 'scrooloose/NERDTree'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
    
    Plug 'dracula/vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'joshdick/onedark.vim' 

    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    
    " ============================ coc ============================
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-eslint'
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

    " For Multiple Cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
    Plug 'morhetz/gruvbox' 

    " Prettier
    Plug 'sbdchd/neoformat'    

    " colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'Johan-Liebert1/nvcode-color-schemes.vim'
call plug#end()
