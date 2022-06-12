source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

if !empty($nvimColorTheme)
    source $HOME/.config/nvim/themes/$nvimColorTheme.vim
endif

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/plug-config/vim-javascript.vim

" In your init.lua or init.vim
set termguicolors
lua << EOF
