let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '~'
let g:signify_line_highlight = 0
let g:signify_number_highlight =  0
" no numbers
let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1


highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
