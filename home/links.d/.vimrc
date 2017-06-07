"Basics {
    set nocompatible                " explicitly get out of vi-compatible mode
    set background=dark             " we plan to use a dark background
    if match($TERM, "screen-256color")!=-1
        set term=xterm-256color
        " Initialize the cursor white at startup
        silent !echo -ne "\033]12;white\007"
"        " Turn the cursor green when entering insert mode
        let &t_SI = "\033]12;green\007"
"        " Turn the cursor white when leaving insert mode
        let &t_EI = "\033]12;white\007"
"        " Make sure the cursor is back to white when Vim exits
        autocmd VimLeave * !echo -ne "\033]12;white\007"
    endif
    if &t_Co >= 256 || has("gui_running")
        try
            colorscheme vividchalk
        catch /^Vim\%((\a\+)\)\=:E185/
            colorscheme koehler
        endtry
    endif
    if &t_Co > 2 || has("gui_running")
        syntax on
    endif
    "   set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
" }
"Colors {
"  define up to 9 custom highlight groups (User1 -> User9) referenced by %1*,
"  %2*, etc, switch back by usign %*
hi User1 ctermbg=black ctermfg=red   guibg=black guifg=red
hi User2 ctermbg=black ctermfg=blue  guibg=black guifg=blue
hi User3 ctermbg=black ctermfg=green guibg=black guifg=green
"  }
" General {
    filetype plugin indent on       " load filetype plugins/indent settings
    set splitright
    set autochdir                   " always switch to the current file directory
    set autowrite                   " automatically save pending changes to the current file before executing stuff
    set backspace=indent,eol,start  " make backspace a more flexible
    set nobackup                    " do not make backup copies
    set noswapfile                  " do not use swap files
    set fileformats=unix,mac,dos    " support all three, in this order
    set hidden                      " you can change buffers without saving
    set noerrorbells                " don't make noise
"   set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
"   set cursorcolumn        " highlight the current column
"   set cursorline          " highlight current line
    set incsearch           " BUT do highlight as you type you search phrase
    set laststatus=2        " always show the status line
    set lazyredraw          " do not redraw while running macros
    set linespace=0         " don't insert any extra pixel lines betweens rows
    set list                " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5         " how many tenths of a second to blink matching brackets for
    set hlsearch            " highlight searched for phrases
    set nostartofline       " leave my cursor where it was
    set novisualbell        " don't blink
    set number              " turn on line numbers
    set numberwidth=4       " We are good up to 9999 lines
"   set report=0            " tell us when anything is changed via :...
    set ruler               " Always show current positions along the bottom
    set scrolloff=2         " Keep 10 lines (top/bottom) for scope
"   set shortmess=aOstT     " shortens messages to avoid
                            " 'press a key' prompt
    set showcmd             " show the command being typed
    set showmatch           " show matching brackets
    set pastetoggle=<F2>    " use F2 to toggle between paste mode and normal mode (paste mode disables auto-indent)
    set sidescrolloff=2     " Keep 2 lines at the size
    set statusline=
    set statusline+=%1*     " switch to User1 Highlight
    set statusline+=%F      " full filename
    set statusline+=%2*     " switch to User2 Highlight
    set statusline+=%y      " filetype
    set statusline+=%=      " magic flag, everything else is pushed to the right
    set statusline+=%3*     " switch to User3 Highlight
    set statusline+=[       " opening square bracket
    set statusline+=%l      " current line
    set statusline+=,       " delimiter
    set statusline+=%v      " current column
    set statusline+=]       " closing square bracket
    set statusline+=%2*     " switch to User2 Highlight
    set statusline+=%9.P    " percentage thru file

"   set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- modified flag in square brackets
    "              +-- full path to file in the buffer
" }
" Text Formatting/Layout {
    set fileformat=unix     " setting the fileformat to unix fo mysql editing
    set completeopt=        " don't use a pop up menu for completions
    set expandtab           " no real tabs please!
    set formatoptions=rq    " Automatically insert comment leader on return, and let gq format comments
    set ignorecase          " case insensitive by default
    set infercase           " case inferred by default
    set nowrap              " do not wrap line
    set nowrapscan          " do not search from the beginning of the file after reaching the bottom
    set shiftround          " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase           " if there are caps, go case-sensitive
    set shiftwidth=4        " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4       " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4           " real tabs should be 8, and they will show with set list on
" }
" Folding {
    set foldenable          " Turn on folding
    set foldmarker={,}      " Fold C style code (only use this as default if you use a high foldlevel)
    set foldmethod=marker   " Fold on the marker
    set foldlevel=100       " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                  " (cleaner than default)
" }
"  SQL Settings {
    let g:sql_type_default = 'mysql'
" }
" DBExt Connection Profiles {
    let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=kbyf!!1323:dbname=arcsys'
    let g:dbext_default_profile = 'mysql_local'
" }
" Mappings {
    " space / shift-space scroll in normal mode
"    nnoremap   <Space>     i
"    inoremap   <M-Space>   <Esc>
" Make Arrow Keys Useful Again {
"       map <down> <ESC>:bn<RETURN>
"       map <left> <ESC>:NERDTreeToggle<RETURN>
"       map <right> <ESC>:Tlist<RETURN>
"       map <up> <ESC>:bp<RETURN>
    " }
" }
" AutoCommands {
    autocmd FileType sh map <buffer> <F5> !%<CR>
    " strip trailing spaces from cs,js,sql files
    autocmd FileType text,sh,cs,js,sql,vim,json autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }
    cnoreabbrev he vertical help
    cnoreabbrev sp vsplit

    xnoremap <silent>. f.oT.o
    xnoremap <silent>a. f.o.F.o
    xnoremap <silent>i. t.o.T.o

    onoremap <silent>. :<C-u>exec 'normal v' . v:count1 . '.'<CR>
    onoremap <silent>a. :<C-u>exec 'normal v' . v:count1 . 'a.'<CR>
    onoremap <silent>i. :<C-u>exec 'normal v' . v:count1 . 'i.' <CR>

" Pathogen {
    execute pathogen#infect()
    execute pathogen#helptags()
" }

" Syntax checking entire file
" Usage: :make (check file)
" :clist (view list of errors)
" :cn, :cp (move around a list of errors)
    autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Python documentation
    let g:pydoc_open_cmd='vsplit'
