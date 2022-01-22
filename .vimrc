set virtualedit+=block
set number
set cursorline
set cursorcolumn
set hlsearch
set smartindent
set list
set listchars=tab:→\ ,trail:˽,eol:↲,extends:»,precedes:«,nbsp:%
set shiftwidth=4
set clipboard&
set clipboard^=unnamedplus
syntax enable
nmap <Esc>> :vertical res +1<Enter>
nmap <Esc>< :vertical res -1<Enter>
nmap <^.> :vertical res +1<Enter>
nmap <^,> :vertical res -1<Enter>


function! MoveAndFoldLeft()
    let line = getpos('.')[1]
    let col  = getpos('.')[2]

    if l:col ==# 1 && foldlevel(l:line)
        execute "foldclose"
    else    
        execute "normal! h"
    endif   
endfunction

nnoremap <silent> <Left>  :call MoveAndFoldLeft()<cr>
nnoremap <silent> h       :call MoveAndFoldLeft()<cr>
