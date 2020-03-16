"basic
set nobackup
set autoread
set noswapfile
set hidden
set browsedir=buffer
set whichwrap=b,s,h,l,<,>,[,]

" colorscheme
autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
colorscheme tender

"display
set wildmenu
set wildmode=longest:full,full
set scrolloff=5
set showcmd
set ruler
set number
set cmdheight=1
set cursorline

syntax on

"mouse
set mouse=a
set guioptions+=a
"set ttymouse=xterm2

"encoding
scriptencoding utf-8
set encoding=utf-8
set fileencoding=japan
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932
set fileformats=unix,dos,mac

"edit
set backspace=indent,eol,start
set smarttab
setlocal formatoptions-=r
setlocal formatoptions-=o
autocmd FileType * setlocal formatoptions-=ro "disable auto comment

""indent
set cindent
set cinoptions=g0,(0,W2,N-s,E-s,m1
"set cino=N-s
"(0,u0
"g0,(0,W4

"insert mode
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

"input
set timeout timeoutlen=1000 ttimeoutlen=75

"tab/indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"search
set incsearch
set ignorecase
set smartcase
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"dir
let g:netrw_liststyle=3

"NERDTree
nmap <silent> ,t :<C-u>NERDTreeToggle<CR>

