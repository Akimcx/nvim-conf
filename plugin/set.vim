" Use of |highlight-guifg| and |highlight-guibg| attributes in the terminal
if $COLORTERM == "truecolor"
    se termguicolors 
    if $TERM == "st-256color"
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

filetype plugin indent on 

se autoread 
se autowriteall 

se undofile

se conceallevel=2

se nobackup
se noswapfile

se encoding=utf-8 

se hidden 

se backspace=eol,indent,start 

se scrolloff=10

se showcmd 

se rnu nu 

se mouse=a 

set wildmenu 
set wildmode=longest:full,list:full 

se splitbelow
se splitright

se cursorline 

se ignorecase 
se smartcase 
se incsearch 
se nohlsearch 

se shiftwidth=4 
se softtabstop=-1
se smarttab 

se autoindent

se formatoptions-=cro

se laststatus=2
let g:currentmode={
        \ 'n'  : 'NORMAL ',
        \ 'v'  : 'VISUAL ',
        \ 'V'  : 'V·Line ',
        \ 'R'  : 'Replace',
        \ ''  : 'V·Block',
        \ 'i'  : 'INSERT ',
        \ 't'  : 'Terminal',
        \ 'c'  : 'Command ',
        \}
se statusline=
se statusline+=\ %{toupper(g:currentmode[mode()])}
se statusline+=\ %f
se statusline+=\ %y
se statusline+=\ %l
se statusline+=\|%c
se statusline+=\ %m%=%p%%\
se statusline+=\ (%Y%R)
