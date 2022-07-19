scriptencoding utf-8
set encoding=utf-8

source $VIMRUNTIME/defaults.vim
set number
exec "set list listchars=tab:\uFFEB\uFF65"
set nowrap
set belloff=all
set ignorecase
set smartcase
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set fileformats=unix,dos,mac
set clipboard=unnamed
set iminsert=0 imsearch=0
set shortmess+=I " don't give the intro message when starting Vim
set laststatus=2 " display status line always
set diffopt=filler,vertical
set fillchars=vert:\ ,fold:-
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

let mapleader = "\<Space>"
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap <C-p> <Plug>AirlineSelectPrevTab
nnoremap <C-n> <Plug>AirlineSelectNextTab
nnoremap <Leader><Leader> <Plug>(lsp-hover)
" fern
nnoremap <silent> <Leader>e :Fern . -drawer -toggle<CR>
"lsp
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
" vim-commentary
xmap <c-/>  <Plug>Commentary
omap <c-/>  <Plug>Commentary
nmap <c-/>  <Plug>CommentaryLine
" comfortable-motion.vim
nnoremap <silent> <S-Down> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <S-Up> :call comfortable_motion#flick(-100)<CR>


if has('win32') || has('win64')
  if empty(glob(expand('~/vimfiles/autoload/plug.vim')))
      execute '!curl -fLo '.expand('~').'/vimfiles/autoload/plug.vim --create-dirs'
                  \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif

" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"             \| PlugInstall --sync | source $MYVIMRC

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
call plug#end()

" colorscheme
colorscheme solarized8
set background=dark

" fern
let g:fern#renderer = "nerdfont"
augroup FernGroup
  autocmd!
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call glyph_palette#apply()
augroup END

" lsp
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': ''}
let g:lsp_document_code_action_signs_hint = {'text': ''}
let g:lsp_diagnostics_float_cursor = 1

" comfortable-motion.vim
let g:comfortable_motion_friction = 160.0
let g:comfortable_motion_air_drag = 4.0

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

if (&encoding == 'utf-8') && exists('*setcellwidths') && has('vim_starting')
  set ambiwidth=single
  let xs = []
  let xs += [[0x2030, 0x203f, 2]] " ‰‱′″‴‵‶‷‸‹›※‼‽‾‿
  let xs += [[0x2103, 0x2103, 2]] " ℃
  let xs += [[0x2160, 0x2169, 2]] " ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩ
  let xs += [[0x2170, 0x2179, 2]] " ⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹ
  let xs += [[0x2190, 0x2193, 2]] " ←↑→↓
  let xs += [[0x21d2, 0x21d2, 2]] " ⇒
  let xs += [[0x21d4, 0x21d4, 2]] " ⇔
  let xs += [[0x2266, 0x2267, 2]] " ≦≧
  let xs += [[0x23fb, 0x23fe, 2]] " ⏻⏼⏽⏾Power Symbols
  let xs += [[0x2460, 0x246f, 2]] " ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯
  let xs += [[0x2470, 0x247f, 2]] " ⑰⑱⑲⑳⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿
  let xs += [[0x2480, 0x248f, 2]] " ⒀⒁⒂⒃⒄⒅⒆⒇⒈⒉⒊⒋⒌⒍⒎⒏
  let xs += [[0x2490, 0x249f, 2]] " ⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛⒜⒝⒞⒟
  let xs += [[0x24a0, 0x24af, 2]] " ⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯
  let xs += [[0x24b0, 0x24bf, 2]] " ⒰⒱⒲⒳⒴⒵ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿ
  let xs += [[0x24c0, 0x24cf, 2]] " ⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
  let xs += [[0x24d0, 0x24df, 2]] " ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟ
  let xs += [[0x24e0, 0x24ef, 2]] " ⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ⓪⓫⓬⓭⓮⓯
  let xs += [[0x24f0, 0x24ff, 2]] " ⓰⓱⓲⓳⓴⓵⓶⓷⓸⓹⓺⓻⓼⓽⓾⓿
  " let xs += [[0x2500, 0x257f, 2]] " https://en.wikipedia.org/wiki/Box_Drawing
  let xs += [[0x25a0, 0x25a1, 2]] " ■□
  let xs += [[0x25b2, 0x25b3, 2]] " ▲△
  let xs += [[0x25bc, 0x25bd, 2]] " ▼▽
  let xs += [[0x25c6, 0x25c7, 2]] " ◆◇
  let xs += [[0x25cb, 0x25cb, 2]] " ○
  let xs += [[0x25cf, 0x25cf, 2]] " ●
  let xs += [[0x2600, 0x260f, 2]] " ☀☁☂☃☄★☆☇☈☉☊☋☌☍☎☏
  let xs += [[0x2610, 0x261f, 2]] " ☐☑☒☓☔☕☖☗☘☙☚☛☜☝☞☟
  let xs += [[0x2620, 0x262f, 2]] " ☠☡☢☣☤☥☦☧☨☩☪☫☬☭☮☯
  let xs += [[0x2630, 0x263f, 2]] " ☰☱☲☳☴☵☶☷☸☹☺☻☼☽☾☿
  let xs += [[0x2640, 0x264f, 2]] " ♀♁♂♃♄♅♆♇♈♉♊♋♌♍♎♏
  let xs += [[0x2650, 0x265f, 2]] " ♐♑♒♓♔♕♖♗♘♙♚♛♜♝♞♟
  let xs += [[0x2660, 0x266f, 2]] " ♠♡♢♣♤♥♦♧♨♩♪♫♬♭♮♯
  let xs += [[0x2670, 0x267f, 2]] " ♰♱♲♳♴♵♶♷♸♹♺♻♼♽♾♿
  let xs += [[0x2690, 0x269c, 2]] " ⚐⚑⚒⚓⚔⚕⚖⚗⚘⚙⚚⚛⚜
  let xs += [[0x26a0, 0x26ad, 2]] " ⚠⚡⚢⚣⚤⚥⚦⚧⚨⚩⚪⚫⚬⚭
  let xs += [[0x26b0, 0x26b1, 2]] " ⚰⚱
  let xs += [[0x26b9, 0x26b9, 2]] " ⚹
  let xs += [[0x2701, 0x2709, 2]] " ✁✂✃✄✆✇✈✉
  let xs += [[0x270c, 0x270f, 2]] " ✌✍✎✏
  let xs += [[0x2710, 0x271f, 2]] " ✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟
  let xs += [[0x2720, 0x2727, 2]] " ✠✡✢✣✤✥✦✧
  let xs += [[0x2729, 0x272f, 2]] " ✩✪✫✬✭✮✯
  let xs += [[0x2730, 0x273f, 2]] " ✰✱✲✳✴✵✶✷✸✹✺✻✼✽✾✿
  let xs += [[0x2740, 0x274d, 2]] " ❀❁❂❃❄❅❆❇❈❉❊❋❍
  let xs += [[0x274f, 0x274f, 2]] " ❏
  let xs += [[0x2750, 0x2752, 2]] " ❐❑❒
  let xs += [[0x2756, 0x2756, 2]] " ❖
  let xs += [[0x2758, 0x275e, 2]] " ❘❙❚❛❜❝❞
  let xs += [[0x2761, 0x276f, 2]] " ❡❢❣❤❥❦❧❨❩❪❫❬❭❮❯
  let xs += [[0x2770, 0x277f, 2]] " ❰❱❲❳❴❵❶❷❸❹❺❻❼❽❾❿
  let xs += [[0x2780, 0x278f, 2]] " ➀➁➂➃➄➅➆➇➈➉➊➋➌➍➎➏
  let xs += [[0x2790, 0x2794, 2]] " ➐➑➒➓➔
  let xs += [[0x2798, 0x279f, 2]] " ➘➙➚➛➜➝➞➟
  let xs += [[0x27f5, 0x27f7, 2]] " ⟵⟶⟷
  let xs += [[0x2b05, 0x2b0d, 2]] " ⬅⬆⬇⬈⬉⬊⬋⬌⬍
  let xs += [[0x2b58, 0x2b58, 2]] " Power Symbols
  let xs += [[0x303f, 0x303f, 2]] " 〿
  let xs += [[0xe000, 0xe00a, 2]] " Pomicons
  " let xs += [[0xe0a0, 0xe0a2, 2]] " Powerline Symbols
  " let xs += [[0xe0a3, 0xe0a3, 2]] " Powerline Extra Symbols
  " let xs += [[0xe0b0, 0xe0b3, 2]] " Powerline Symbols
  " let xs += [[0xe0b4, 0xe0c8, 2]] " Powerline Extra Symbols
  " let xs += [[0xe0ca, 0xe0ca, 2]] " Powerline Extra Symbols
  " let xs += [[0xe0cc, 0xe0d4, 2]] " Powerline Extra Symbols
  let xs += [[0xe200, 0xe2a9, 2]] " Font Awesome Extension
  let xs += [[0xe300, 0xe3e3, 2]] " Weather
  let xs += [[0xe5fa, 0xe62e, 2]] " Custom + Seti
  let xs += [[0xe700, 0xe7c5, 2]] " Devicons
  let xs += [[0xf000, 0xf2e0, 2]] " Font Awesome
  let xs += [[0xf300, 0xf31c, 2]] " Font Logos (Font Linux)
  let xs += [[0xf400, 0xf4a8, 2]] " Octicons
  let xs += [[0xf500, 0xfd46, 2]] " Material
  call setcellwidths(xs)
endif
