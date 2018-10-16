call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-obsession'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gorodinskiy/vim-coloresque'

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'dln/avro-vim'

Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'lchi/vim-toffee'

Plug 'sheerun/vim-polyglot'
" Plug 'flowtype/vim-flow', { 'for': 'javascript' }
" Plug 'steelsojka/deoplete-flow'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

call plug#end()

let mapleader="`"

"" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

autocmd Filetype go setlocal ts=4 sts=4 sw=4 expandtab

" open path under cursor
" :map <C-V> :vertical wincmd f<CR>

" js
let g:javascript_plugin_flow = 0 "javascript flow syntax support
let g:jsx_ext_required = 0 "let jsx helper work on js
let g:flow#enable = 0

" LanguageClient
" set hidden
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['flow-language-server', '--flow-path=/home/songgao/gopath/src/github.com/keybase/client/shared/node_modules/.bin/flow', '--stdio'],
"     \ 'javascript.jsx': ['flow-language-server', '--flow-path=/home/songgao/gopath/src/github.com/keybase/client/shared/node_modules/.bin/flow', '--stdio'],
"     \ }
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" let g:LanguageClient_rootMarkers = ['.flowconfig']
" let g:LanguageClient_selectionUI = 'location-list'
" let g:LanguageClient_diagnosticsList = 'Location'


" Tab highlights
"set list
"set listchars=tab:T>

filetype on
filetype plugin on
filetype indent on

set autowrite
set mouse=a
set undofile
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" performance
set lazyredraw

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
set number
set colorcolumn=80
set showmatch
set ruler
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Visual: theme
set background=dark
colorscheme hybrid_material

" Visual: vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=234

" echodoc
set noshowmode
set cmdheight=2

" vim-airline
let g:airline_theme = 'tomorrow'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#obsession#enabled = 1

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

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 200
let g:deoplete#file#enable_buffer_path = 1
set completeopt+=noselect
set completeopt-=preview
au FileType javascript setlocal omnifunc=flowcomplete#Complete

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['func', 'var', 'const', 'type', 'package']
let g:deoplete#sources#go#pointer = 1

" deoplete-flow
let g:deoplete#source#attribute#min_pattern_length = 0
let g:python3_host_prog = 'python3'
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

" JS prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


" gitgutter
noremap <C-g> :GitGutterLineHighlightsToggle<CR>
let g:gitgutter_diff_args = '-w'

" Dash
:nmap <silent> <leader>d <Plug>DashSearch

" NERD Tree
noremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'x'
let g:NERDTreeMapOpenVSplit = 'v'

" TagBar
nmap <silent> <F4> :TagbarToggle<CR>

" CtrlP -> FZF
nnoremap <c-p> :FZF<cr>

" neovim Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" autocmd BufWinEnter,WinEnter term://* startinsert
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

nnoremap <C-q>     :Ttoggle<CR>


nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>
nnoremap <M-k> <C-y><C-y><C-y><C-y>
nnoremap <M-j> <C-e><C-e><C-e><C-e>
