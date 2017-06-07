" function to convert a mysql trace file output to a csv file
:function! g:ConvertToCsv()
: %s/^| /"/g
: %s/ |$/"/g
: %s/ | /","/g
: %s/  //g
:endfunc

" and a Alt+N key map
nnoremap <F11> :call g:ConvertToCsv()<cr>
