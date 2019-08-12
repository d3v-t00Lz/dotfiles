" Various tab options
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Set an indicator at 80 character line length
set colorcolumn=80

" Show line numbers
set number

" Show wildmenu when tab completing
set wildmenu

" For lines that wrap, wrap starting at the indent and not column 0
set breakindent

" Various style options
hi CursorLine term=bold cterm=bold guibg=Grey40

" Trim trailing whitespace when saving files
autocmd BufWritePre * :%s/\s\+$//e

