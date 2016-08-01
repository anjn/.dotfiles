let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
"let g:unite_enable_split_vertically = 0
"let g:unite_winwidth = 40
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,u :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,s :<C-u>Unite -buffer-name=search line -no-quit<CR>
nnoremap <silent> ,o :<C-u>Unite outline<CR>
