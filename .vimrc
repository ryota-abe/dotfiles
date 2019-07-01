scriptencoding utf-8
set encoding=utf-8
set nocompatible
set number
set ruler
set nolist
set nowrap
set showcmd
set belloff=all
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set scrolloff=4
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard=unnamed
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
set shortmess+=I
set laststatus=2
set diffopt=filler,vertical
set fillchars=vert:\ ,fold:-
set termguicolors
set noswapfile
set hidden
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif

"------------------------------------------------------------
"dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('mattn/emmet-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('yuttie/comfortable-motion.vim')

  " appearance
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('bronson/vim-trailing-whitespace')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif
"------------------------------------------------------------

"ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
\ }

"gitgutter
set signcolumn=yes

"nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable  = "\u25b8"
let g:NERDTreeDirArrowCollapsible = "\u25be"

"comfortable-motion.vim
let g:comfortable_motion_friction = 160.0
let g:comfortable_motion_air_drag = 4.0
nnoremap <silent> <S-Down> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <S-Up> :call comfortable_motion#flick(-100)<CR>

"ctrlp.vim
let g:ctrlp_max_files=0

"colorscheme
let g:solarized_italics=0
colorscheme solarized8
set background=dark
hi DiffAdd    ctermbg=235 ctermfg=108 cterm=reverse guibg=#262626 guifg=#87af87 gui=reverse
hi DiffDelete ctermbg=235 ctermfg=131 cterm=reverse guibg=#8c4c4c guifg=#af5f5f gui=reverse
hi DiffText   ctermbg=235 ctermfg=208 cterm=reverse guibg=#262626 guifg=#ff8700 gui=reverse

"mappings
let mapleader = "\<Space>"
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <F3> :cn<CR>
nnoremap <S-F3> :cp<CR>
nnoremap <silent> <ESC><ESC> :noh<CR>
command! -nargs=0 CD cd %:p:h

"GUI
set guioptions-=T "hide toolbar
set guioptions-=t "no tearoff-menu
set guifont=HackGen:h12:cDEFAULT
set rop=type:directx,renmode:5
