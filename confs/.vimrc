set shell=/bin/bash
set nocompatible
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build' : {
\     'mac' : './install.sh --clang-completer',
\     'unix' : './install.sh --clang-completer',
\   },
\ }

filetype plugin indent on
NeoBundleCheck



" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("syntax")
  syntax on
endif

set laststatus=2
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)
set backspace=indent,eol,start

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

set wildmenu
set number
set colorcolumn=80
set undofile

colorscheme Tomorrow-Night
let g:airline_powerline_fonts = 1
set completeopt+=longest,menuone
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_cxx.py'
map <C-k> :NERDTreeToggle<CR>

au! BufRead,BufNewFile *.json set filetype=json 
let g:gofmt_command="goimports"
au BufWritePre *.go Fmt
au FileType go setl noet ts=4 tw=0 makeprg=go\ build
