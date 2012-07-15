if has("syntax")
  syntax on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

au! BufRead,BufNewFile *.json set filetype=json 

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

filetype plugin indent on
set ofu=syntaxcomplete#complete

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

set wildmenu
set mouse=a
set number
syntax enable

let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized
set background=dark

if has("gui_running")
    colorscheme xoria256
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
endif

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

set colorcolumn=80
set relativenumber
set undofile
set shell=/bin/bash
