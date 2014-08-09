set nocompatible " not vi compatible

"--------------
" Load pathogen
"--------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"---------------------
" Basic editing config
"---------------------
let mapleader=","
set nu " number lines
set incsearch " incremental search (as string is being typed)
set hls " highlight search
exec "set listchars=tab:\uBB\uBB,nbsp:~"
set list
set lbr " line break
set ruler " show current position in file
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=4096 " more history
set foldmethod=syntax " use syntax to define folds
" unfold everything by default
autocmd Syntax * normal zR
" use 2 spaces instead of tabs during formatting
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)

"-------------------
" Disable arrow keys
"-------------------
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"--------------
" Better saving
"--------------
inoremap jj <esc> :w!<cr>
map <leader>w :w!<cr>

"--------------------
" Misc configurations
"--------------------
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Better Ack
nmap <leader>f :Ack! 

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

" Treat folds as text-objects
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>

"------
" Theme
"------
colorscheme jellybeans
set guifont=Anonymous\ Pro:h14
set background=dark
"let base16colorspace=256  " Access colors present in 256 colorspace
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' }
\ }

"--------
" Plugins
"--------
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_auto_loc_list=2

"---------------------
" Local customizations
"---------------------
" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
