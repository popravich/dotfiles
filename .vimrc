
set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

set guioptions-=T   " disable toolbar
set guioptions-=m   " and menu

set rtp+=~/.vim/deps/Vundle.vim

call pathogen#infect()

" setup color scheme and font
colorscheme desert
set cc=80
hi ColorColumn ctermbg=red guibg=black
set nowrap
set guifont=Monospace\ 9


" Highligh a word under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
hi CurWord cterm=underline gui=underline
autocmd CursorMoved * exe printf('match CurWord /%s/', escape(printf('\<%s\>', expand('<cword>')), '[]/~*'))

" hide *.pyc files in netrw view
let g:netrw_list_hide= '^.*\.pyc,.*\.sw[op]'


" read from template (func_test_tmpl.py, unit_test_tmpl.py)
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:h:h:t_test_tmpl.%:e

" map F5 to :redraw!
map <F5> :redraw!<Enter>

" typescript ftdetect
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.as set filetype=actionscript

" makefile fix
autocmd FileType make setlocal noexpandtab

" Vundle setup
call vundle#begin()
" Plugins list
Plugin 'tpope/vim-pathogen'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'groenewege/vim-less'
Plugin 'hallison/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'gmarik/Vundle.vim'
" obsolete plugins used as submodules
" Plugin 'file:///home/alexey/.vim/deps/vim-coffee-script'
" Plugin 'file:///home/alexey/.vim/deps/vim-fugitive'
" Plugin 'file:///home/alexey/.vim/deps/vim-less'
" Plugin 'file:///home/alexey/.vim/deps/vim-markdown'
call vundle#end()
