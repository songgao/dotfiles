call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'kassio/neoterm'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'dln/avro-vim'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'metakirby5/codi.vim'

" Plug 'Valloric/YouCompleteMe'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'bling/vim-bufferline'

call plug#end()

let mapleader="`"

"" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2
set autoindent

filetype on
filetype plugin on
filetype indent on

set autowrite
set mouse=a
set undofile
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" key binding: Ctrl-N for moving cursor in auto-complete list
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set ttimeout
set ttimeoutlen=0
set matchtime=0

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Visual
syntax on
set colorcolumn=80
set showmatch
set ruler
set number
colorscheme hybrid_material
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" vim-airline
let g:airline_theme = 'tomorrow'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info=0
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'NeomakeWarningSign'}
let g:neomake_info_sign = {'text': 'i>', 'texthl': 'NeomakeInfoSign'}
let g:neomake_message_sign = {'text': 'm>', 'texthl': 'NeomakeMessageSign'}

" deoplete-go
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['func', 'var', 'const', 'type', 'package']
let g:deoplete#sources#go#pointer = 1
set completeopt+=noselect
set completeopt-=preview

" echodoc
set noshowmode

" gitgutter
noremap <C-g> :GitGutterLineHighlightsToggle<CR>

" Dash
:nmap <silent> <leader>d <Plug>DashSearch

" NERD Tree
noremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" TagBar
nmap <silent> <F4> :TagbarToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" neovim Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" *.avdl
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" key bindings: Shift-H and Shift-L for navigating tabs; Ctrl-t for new tab
nnoremap H gT
nnoremap L gt
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" key bindings: Ctrl-s/v for splits
nnoremap <C-s>     :sp<CR>
nnoremap <C-v>     :vsp<CR>


map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

