" Make vim more useful
set nocompatible

" Enhance command-line completion
set wildmenu

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Start scrolling two lines before the horizontal window border
set scrolloff=2

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Highlight searches
set hlsearch

" Ignore caps locks in searches
set ignorecase

" Don’t show the intro message when starting vim
set shortmess=atI

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>
