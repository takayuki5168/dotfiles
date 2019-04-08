set encoding=UTF-8
set nocompatible
set number
set whichwrap+=h,l
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set smarttab
set autoindent
set softtabstop=4
set backspace=start,eol,indent
set hidden
set incsearch
set hlsearch
set wrapscan
set mouse=a
set wildignore=*.o
set ignorecase
set smartcase
set laststatus=2
set clipboard=unnamedplus
set nobackup
nnoremap j gj
nnoremap k gk
set noswapfile
set virtualedit=onemore
if &compatible
  set nocompatible
endif
function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format-3.7"
  exec ":" . now_line
endfunction
if executable('clang-format-3.7')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
  augroup c_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call s:clang_format()
  augroup END
endif
