" function to toggle line numbers between relative and absolute
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc

" and a Ctrl+L key map
nnoremap <S-F10> :call g:ToggleNuMode()<cr>
