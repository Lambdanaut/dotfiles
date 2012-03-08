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

" Python helpers
autocmd filetype python set tabstop=2
autocmd filetype python set shiftwidth=2
autocmd filetype python set smarttab
autocmd filetype python set expandtab
autocmd filetype python set softtabstop=2
autocmd filetype python set autoindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>
