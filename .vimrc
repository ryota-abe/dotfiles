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
set noexpandtab
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard=unnamed
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
set shortmess+=I
set laststatus=2

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('itchyny/lightline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mattn/emmet-vim')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('yuttie/comfortable-motion.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set noshowmode " for lightline
set signcolumn=yes " for gitgutter

"nerdtree
let NERDTreeShowHidden=1

"comfortable-motion.vim
let g:comfortable_motion_friction = 160.0
let g:comfortable_motion_air_drag = 4.0
nnoremap <silent> <S-Down> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <S-Up> :call comfortable_motion#flick(-100)<CR>

colorscheme solarized
set t_Co=256
set fillchars=vert:\ ,fold:-

set diffopt=filler,vertical
hi DiffAdd    ctermbg=235 ctermfg=108 cterm=reverse guibg=#262626 guifg=#87af87 gui=reverse "green
hi DiffDelete ctermbg=235 ctermfg=131 cterm=reverse guibg=#8c4c4c guifg=#af5f5f gui=reverse "red
hi DiffText   ctermbg=235 ctermfg=208 cterm=reverse guibg=#262626 guifg=#ff8700 gui=reverse "orange

"mappings
let mapleader = "\<Space>"
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <F3> :cn<CR>
nnoremap <S-F3> :cp<CR>
nnoremap <ESC><ESC> :noh<CR>
command! -nargs=0 CD cd %:p:h

"GUI OPTIONS
set guioptions-=T "hide toolbar
set guioptions-=t "no tearoff-menu
set guifont=Myrica_M:h12:cDEFAULT
