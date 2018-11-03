set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set colorcolumn=80 number
set wildmenu
hi CursorLine term=bold cterm=bold guibg=Grey40

autocmd BufWritePre * :%s/\s\+$//e

