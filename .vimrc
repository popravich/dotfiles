syntax on

set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set modeline

set guioptions-=T   " disable toolbar
set guioptions-=m   " and menu

" setup color scheme and font
colorscheme desert
set cc=80
hi ColorColumn ctermbg=red guibg=black
set nowrap
" set guifont=Monospace\ 9
" set guifont=Ubuntu\ Mono\ 13
set guifont=DejaVu\ Sans\ Mono\ 9

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

autocmd FileType yaml,html,css,javascript,coffee,lua,vue setlocal expandtab autoindent tabstop=2 shiftwidth=2 softtabstop=2

" Vim-plug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()


" hide *.pyc files in netrw view
let g:netrw_list_hide = '^.*\.pyc,.*\.sw[op]'
let g:netrw_sort_sequence = '[\/],\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
let g:netrw_liststyle = 1

" autoset current directory to project's root
autocmd BufEnter * silent! exec "lcd " . system('dirname $(cd '.expand('%:h').' && git rev-parse --absolute-git-dir)')

" FileType-specific options
autocmd FileType rust setlocal cc=99


let g:airline_theme="base16"
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#hunks#coc_git = 1
let g:airline_powerline_fonts = 1

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
