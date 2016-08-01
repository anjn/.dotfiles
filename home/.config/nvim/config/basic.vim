"basic
set nobackup
set autoread
set noswapfile
set hidden
set browsedir=buffer
set whichwrap=b,s,h,l,<,>,[,]

"display
"" white background
autocmd ColorScheme * highlight Normal ctermbg=15 
"colorscheme jellybeans
"colorscheme delek
colorscheme Tomorrow
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
set cinoptions=g0,(0
set cino=N-s
"(0,u0
"g0,(0,W4

"insert mode
inoremap <C-e> <END>
inoremap <C-a> <HOME>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
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
"nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"dir
let g:netrw_liststyle=3

"cursor
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call Auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call Auto_cursorline('CursorHold')
  autocmd WinEnter * call Auto_cursorline('WinEnter')
  autocmd WinLeave * call Auto_cursorline('WinLeave')

  let g:cursorline_lock = 0
  function! Auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let g:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if g:cursorline_lock
        if 1 < g:cursorline_lock
          let g:cursorline_lock = 1
        else
          setlocal nocursorline
          let g:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let g:cursorline_lock = 1
    endif
  endfunction
augroup END
