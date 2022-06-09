call plug#begin('~/.config/nvim/autoload/plugged')
	" Better syntax support
	Plug 'sheerun/vim-polyglot'

	" File explorer
	Plug 'scrooloose/NERDTree'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
    
    Plug 'dracula/vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    
    " status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
call plug#end()
