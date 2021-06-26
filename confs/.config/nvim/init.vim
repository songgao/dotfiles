call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim' " status bar / tabs
Plug 'liuchengxu/vista.vim' " right column

Plug 'rhysd/git-messenger.vim'
Plug 'mhinz/vim-signify'

" Fugitive is required for Conflicted
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

Plug 'neomake/neomake'
" Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-obsession'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'dln/avro-vim'

Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'lchi/vim-toffee'

Plug 'sheerun/vim-polyglot'

" c++
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'tpope/vim-surround'

Plug 'dhruvasagar/vim-table-mode'

call plug#end()

let mapleader="`"

"" Lightline
" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
" https://github.com/neoclide/coc.nvim/issues/512
" https://github.com/liuchengxu/vista.vim#show-the-nearest-methodfunction-in-the-statusline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'CurrentFunction', 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'CurrentFunction': 'CurrentFunction'
      \ },
      \ }
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
function! CurrentFunction()
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

"" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

autocmd Filetype go setlocal ts=4 sts=4 sw=4 expandtab

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
" set relativenumber
set colorcolumn=80
set showmatch
set ruler
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" Visual: theme
set background=dark
colorscheme hybrid_reverse

" Visual: vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=234

" vista
let g:vista#renderer#enable_icon = 1
nmap <silent> <F4> :Vista!!<CR>

" echodoc
set noshowmode
set cmdheight=2

" Go
" adapted from vim-go
" function! GoImports()
"   let l:curw = winsaveview()
"   %! goimports | gofmt
"   " run through gofmt again to make sure it uses format fro GOROOT's gofmt
"   %! gofmt
"   call winrestview(l:curw)
" endfunction
" autocmd FileType go autocmd BufWritePre <buffer> call GoImports()
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" neomake
autocmd! BufWritePost * Neomake
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'NeomakeWarningSign'}
let g:neomake_info_sign = {'text': 'i>', 'texthl': 'NeomakeInfoSign'}
let g:neomake_message_sign = {'text': 'm>', 'texthl': 'NeomakeMessageSign'}

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set updatetime=200

" coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css', 'coc-highlight', 'coc-go', 'coc-clangd']
" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermbg=Grey guibg=Grey
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" git-messenger
nmap <C-m> <Plug>(git-messenger)
" signify
nmap <C-g> :SignifyToggleHighlight<cr>
" git-conflicted
" Use `gl` and `gu` rather than the default conflicted diffget mappings
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
set stl+=%{ConflictedVersion()}

" Dash
:nmap <silent> <leader>d <Plug>DashSearch

" NERD Tree
noremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'x'
let g:NERDTreeMapOpenVSplit = 'v'

" CtrlP -> FZF
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Rg<cr>

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
