set encoding=utf-8
scriptencoding utf-8
source $VIMRUNTIME/defaults.vim
set number
set list listchars=tab:￫･
set nowrap
set belloff=all
set ignorecase
set smartcase
set hlsearch
set tabstop=2 softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set fileformats=unix,dos,mac
set clipboard=unnamed
set iminsert=0 imsearch=0
set shortmess+=I
set laststatus=2
set diffopt=filler,vertical
set fillchars=vert:│,fold:\ "
if v:version >= 900
  set fillchars+=eob:\ "
endif
set termguicolors
set noswapfile
set hidden
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif
set foldtext=s:FoldText()
set foldmethod=syntax
set foldlevelstart=99
function! s:FoldText() abort
  let s:line = getline(v:foldstart)
  if s:line[0:0] == ' '
    return '⊞' . s:line[1:] . ' …'
  else
    return '⊞' . s:line . ' …'
  endif
endfunction

let g:mapleader = "\<Space>"
nnoremap <silent> <Esc><Esc> <Cmd>redraw!<CR><Cmd>nohlsearch<CR>

nnoremap <F3> <Cmd>cnext<CR>
nnoremap <S-F3> <Cmd>cprev<CR>

command! -nargs=0 CD cd %:p:h

function! g:ToggleTerminal() abort
  if empty(term_list())
    execute 'botright terminal'
    execute 'resize 16'
  else
    let s:bufnr = term_list()[0]
    if getbufinfo(s:bufnr)[0].hidden
      execute 'botright sbuffer' . s:bufnr
      execute 'resize 16'
    else
      call win_gotoid(win_findbuf(s:bufnr)[0])
    endif
  endif
endfunction
nnoremap <silent> <C-@> <Cmd>call g:ToggleTerminal()<CR>
tnoremap <silent> <C-@> <Cmd>hide<CR>

if has('win32') || has('win64')
  if empty(glob(expand('~/vimfiles/autoload/plug.vim')))
      execute '!curl -fLo '.expand('~').'/vimfiles/autoload/plug.vim --create-dirs'
                  \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      execute 'PlugInstall --sync | source $MYVIMRC'
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      execute 'PlugInstall --sync | source $MYVIMRC'
  endif
endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'
Plug 'junegunn/vim-easy-align'
Plug 'markonm/traces.vim'
call plug#end()

" colorscheme
colorscheme solarized8
set background=dark
highlight VertSplit guifg=#586e75 guibg=NONE gui=NONE cterm=NONE

" vim-commentary
xnoremap <C-/> <Plug>Commentary
onoremap <C-/> <Plug>Commentary
nnoremap <C-/> <Plug>CommentaryLine

" vim-easy-align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" fern
let g:fern#renderer = "nerdfont"
nnoremap <silent> <Leader>e <Cmd>Fern . -drawer -toggle<CR>30<C-w>|
function! s:init_fern() abort
  nnoremap <buffer><nowait> e <Nop>
  nnoremap <buffer><nowait> <Leader>e <Cmd>hide<CR>
  setlocal norelativenumber
  setlocal nonumber
  call glyph_palette#apply()
endfunction
augroup init_fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_by_filename = 1
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_clear_cache_on_exit = 0

" vim-lsp
let g:lsp_log_verbose=1 | let g:lsp_log_file = expand('~/lsp.log')
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': ''}
let g:lsp_document_code_action_signs_hint = {'text': ''}
let g:lsp_diagnostics_float_cursor = 1
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <F2> <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  if &filetype != 'vim' && &filetype != 'help'
    nmap <buffer> K <plug>(lsp-hover)
  endif
  nmap <buffer> <C-k> <plug>(lsp-peek-definition)
  imap <buffer> <C-Space> <Plug>(asyncomplete_force_refresh)
endfunction

" vim-lsp-settings
augroup lsp_install
  autocmd!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" comfortable-motion.vim
let g:comfortable_motion_friction = 160.0
let g:comfortable_motion_air_drag = 4.0
nnoremap <silent> <S-Down> <Cmd>call comfortable_motion#flick(100)<CR>
nnoremap <silent> <S-Up> <Cmd>call comfortable_motion#flick(-100)<CR>

" vim-airline
set noshowmode
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.whitespace = 'Ξ'
nnoremap <C-h> <Plug>AirlineSelectPrevTab
nnoremap <C-l> <Plug>AirlineSelectNextTab

" vim-fugitive
nnoremap <Leader>g :silent<Space>Ggrep<Space>""<Bar>cw<Left><Left><Left><Left>

runtime ambiwidth_Cica.vim

