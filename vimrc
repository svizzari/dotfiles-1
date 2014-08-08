set nocompatible " not vi compatible

"--------------
" Load pathogen
"--------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


"--------------
" Settings
"--------------
" Syntax highlighting
au BufRead,BufNewFile *.hdbs,*.rhdbs set filetype=handlebars
autocmd FileType ruby set foldmethod=syntax

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Use the mouse
set mouse=a

" Folding
set foldcolumn=2
set foldlevelstart=20
set foldmethod=indent


"--------------
" Mappings
"--------------
let mapleader = ","
inoremap jj <esc> :w!<cr>
map <leader>w :w!<cr>

" Better Ack
nmap <leader>f :Ack! 

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

" Treat folds as text-objects
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>


"--------------
" Theme
"--------------
colorscheme jellybeans
set guifont=Anonymous\ Pro:h14
set background=dark
"let base16colorspace=256  " Access colors present in 256 colorspace
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' }
\ }


"--------------
" Plugins
"--------------
" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_auto_loc_list=2
