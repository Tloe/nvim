call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'nvie/vim-flake8'
Plug 'Kuniwak/vint'
Plug 'w0rp/ale'
Plug 'christoomey/vim-system-copy'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'kien/ctrlp.vim'
Plug 'mgee/lightline-bufferline'
Plug 'qpkorr/vim-bufkill'

call plug#end()

let g:lightline = {
  \   'colorscheme': 'gruvbox',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \   'left': '', 'right': '' 
  \}
let g:lightline.tabline = {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type = { 'buffers': 'tabsel' }
let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#unicode_symbols=1

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

colorscheme gruvbox

set termguicolors
"if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
"    set notermguicolors
"else
"    set termguicolors
"endif

set background=dark
set number
set relativenumber
set lazyredraw
set noshowmode " lightline shows insert so no need to show mode
set hidden "Allow hidden buffers
let g:GPGUseAgent=0


" Move line(s) macros
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" tab completion in deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set pastetoggle=<F3>

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDorArrows=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFocus<CR>

set mouse=a

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif

:inoremap jj <Esc>

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set list

"let g:vem_tabline_multiwindow_mode=0

nnoremap <Leader>1 <Plug>lightline#bufferline#go(1)
nnoremap <Leader>2 <Plug>lightline#bufferline#go(2)
nnoremap <Leader>3 <Plug>lightline#bufferline#go(3)
nnoremap <Leader>4 <Plug>lightline#bufferline#go(4)
nnoremap <Leader>5 <Plug>lightline#bufferline#go(5)
nnoremap <Leader>6 <Plug>lightline#bufferline#go(6)
nnoremap <Leader>7 <Plug>lightline#bufferline#go(7)
nnoremap <Leader>8 <Plug>lightline#bufferline#go(8)
nnoremap <Leader>9 <Plug>lightline#bufferline#go(9)
nnoremap <Leader>0 <Plug>lightline#bufferline#go(10)

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>l :ls<CR>:b<space>

nnoremap <M-h> :bp<CR>
nnoremap <M-l> :bn<CR>


nnoremap <Enter> :redraw!<CR>

set cursorline
set splitbelow

"copy paste to clipboard
inoremap <C-v> <ESC>"=substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>pi
nnoremap <C-v> "=substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>p

vnoremap <C-c> :'<,'>:w !/mnt/c/Windows/System32/clip.exe<CR><CR>
