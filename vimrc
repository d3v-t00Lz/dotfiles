" Syntax highlighting, for Mac OS X
filetype plugin indent on
syntax on

" Various tab options
set autoindent tabstop=4 softtabstop=0 shiftwidth=4 smarttab

" Use spaces instead of tabs
autocmd BufNewFile,BufRead *.c,*.h,*.py set expandtab

" Use tabs instead of spaces
autocmd BufNewFile,BufRead *.go,Makefile set noexpandtab

" Disable swap file creation
set noswapfile

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

" Always show the tab line
set showtabline=2

" Create the alias :db to diff the buffer with the file on disk
cnoreabbrev db w !diff -u % -

" Rename tabs to show tab number.
" Based on http://stackoverflow.com/questions/5927952
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    highlight link TabNum Special
endif
