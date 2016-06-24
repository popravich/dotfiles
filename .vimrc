
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
let g:netrw_list_hide = '^.*\.pyc,.*\.sw[op]'
let g:netrw_liststyle = 1


" read from template (func_test_tmpl.py, unit_test_tmpl.py)
" autocmd BufNewFile * silent! 0r ~/.vim/templates/%:h:h:t_test_tmpl.%:e

" map F5 to :redraw!
map <F5> :redraw!<Enter>

" typescript ftdetect
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.as set filetype=actionscript

" FileType-specific options
autocmd FileType make setlocal noexpandtab
autocmd FileType yaml,html,javascript,coffee,lua setlocal expandtab autoindent tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType rst setlocal expandtab autoindent tabstop=3 shiftwidth=3 softtabstop=3

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
Plugin 'rust-lang/rust.vim'
Plugin 'rking/ag.vim'
call vundle#end()

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list=1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
