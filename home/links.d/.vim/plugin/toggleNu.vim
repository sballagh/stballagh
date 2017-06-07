" function to toggle line numbers on and off
function! g:ToggleNu()
    if(&nu == 1 || &rnu == 1)
        set nu!
    else
        set nu
    endif
endfunc

" and a Alt+N key map
nnoremap <F10> :call g:ToggleNu()<cr>
