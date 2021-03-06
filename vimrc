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
syntax on
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
set foldmethod=indent " use syntax to define folds
set smartindent
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
set laststatus=2

"-------------------
" Arrow keys
"-------------------
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

"--------------
" Better saving
"--------------
inoremap jj <esc> :w!<cr>
map <leader>w :w!<cr>

"---------
" Seaching
"---------
" Better Ack
nmap <leader>f :Ack!<space>

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

"-------------
" Git commands
"-------------
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

"-----------
" Unimpaired
"-----------
" Normal Mode: Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Visual Mode: Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

"--------------------
" Misc configurations
"--------------------
" Treat folds as text-objects
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>

" Toggle comment
map <leader>/ <plug>NERDCommenterToggle<CR>

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" Tagbar
map <leader>rt :TagbarToggle<CR>

" Toggle paste mode
set pastetoggle=<F4>

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Adjust viewports to the same size
map <leader>= <C-w>=

" Vim repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------
" Theme
"------
colorscheme jellybeans
set guifont=Anonymous\ Pro:h16
set background=dark
set t_Co=256
let g:lightline={ 'colorscheme': 'jellybeans' }

" ---------
" Filetypes
" ---------
filetype plugin indent on

" au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript

"--------
" Plugins
"--------
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

let NERDTreeHijackNetrw=1

let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_auto_loc_list=2

"---------------------
" Local customizations
"---------------------
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
