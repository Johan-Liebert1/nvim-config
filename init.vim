source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

if !empty($nvimColorTheme)
    source $HOME/.config/nvim/themes/$nvimColorTheme.vim
endif

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/plug-config/vim-javascript.vim
source $HOME/.config/nvim/plug-config/prettier.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/rainbowcols.vim
source $HOME/.config/nvim/plug-config/signify.vim

" lua configs
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
luafile $HOME/.config/nvim/plug-config/treesitter.lua
luafile $HOME/.config/nvim/lua/bufferLine.lua
