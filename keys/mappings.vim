" Remaps
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>

" ctrl + ] to go to the next buffer and ctrl + [ to go the previous buffer
noremap <C-]> :bn<Enter>
noremap <C-[> :bp<Enter>

" save and close with ctrl + x + s
inoremap <C-x>s :wq<Enter>
nnoremap <C-x>s :wq<Enter>

" close with ctrl + x + x
inoremap <C-x>x :q<Enter>
nnoremap <C-x>x :q<Enter>

:inoremap jj <Esc>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctrl + shift + l to clear the last selection highlight
nnoremap <C-\> :noh<Enter>

" ctrl + b to toggle NERDTree
nnoremap <M-b> :NERDTreeToggle <Enter>

" ctrl + p to fuzzy find file
nnoremap <C-p> :FZF <Enter>
