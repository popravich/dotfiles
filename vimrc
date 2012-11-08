
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent

set guioptions-=T   " disable toolbar
set guioptions-=m   " and menu

call pathogen#infect()

" setup color scheme and font
colorscheme desert
set cc=80
hi ColorColumn ctermbg=black guibg=black
set nowrap
set guifont=Monospace\ 9


" Highligh a word under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
hi CurWord cterm=underline gui=underline
autocmd CursorMoved * exe printf('match CurWord /%s/', escape(printf('\<%s\>', expand('<cword>')), '[]/'))

" hide *.pyc files in netrw view
let g:netrw_list_hide= '^.*\.pyc'


" read from template (func_test_tmpl.py, unit_test_tmpl.py)
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:h:h:t_test_tmpl.%:e

" map F5 to :redraw!
map <F5> :redraw!<Enter>
