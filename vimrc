""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Acacia Kassim As'sad (Akim)


" xdg specification
se runtimepath^=$XDG_CONFIG_HOME/vim
se runtimepath+=$XDG_CONFIG_HOME/vim/after
se packpath^=$XDG_CONFIG_HOME/vim
se packpath+=$XDG_CONFIG_HOME/vim/after
se viewdir=$XDG_CONFIG_HOME/vim/view
se undodir=$XDG_DATA_HOME/vim/undo
let g:netrw_home = $XDG_CONFIG_HOME."/vim"
if !has('nvim')
    se viminfo+=n$XDG_DATA_HOME/vim/viminfo
    se viminfofile=$XDG_DATA_HOME/vim/viminfo
endif

" Package
""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! matchit
" packadd! dracula


" ColorScheme
""""""""""""""""""""""""""""""""""""""""""""""""""
" color dracula
" let g:dracula_colorterm=0
 
" let g:gruvbox_transparent_bg=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
color gruvbox
se background=dark
syntax enable

highlight CursorLineNr guibg=#444444
highlight Normal guibg=NONE
highlight CursorLine guibg=#444444

"Path settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**


" Function
""""""""""""""""""""""""""""""""""""""""""""""""""
fu Merge()
    exec "silent !xrdb -m %" | redraw! | echo expand("%")"merged"
endf


" Autocommand
""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufWritePost vimrc :silent so % 
au BufWritePost .Xresources call Merge()


" Ale Config
packloadall
silent! helptags ALL
