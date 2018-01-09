if &compatible
  set nocompatible
endif

let s:dein_cache_path = expand('~/.cache/dein')
let s:dein_dir = s:dein_cache_path.'/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

runtime! config/*.vim
