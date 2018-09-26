call plug#begin('~/.local/share/nvim/plugged')

" Directory browse
Plug 'scrooloose/nerdtree'

Plug 'Valloric/YouCompleteMe'

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

Plug 'nvie/vim-flake8'
Plug 'Kuniwak/vint'
Plug 'w0rp/ale'

Plug 'christoomey/vim-system-copy'

Plug 'jamessan/vim-gnupg'
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
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

colorscheme gruvbox

set termguicolors
if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
    set notermguicolors
else
    set termguicolors
endif

set background=dark
set number
set relativenumber

" lightline shows insert so no need to show mode
set noshowmode

:au FileChangedShell * echo 'Warning: File changed on disk'
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

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFocus<CR>

set mouse=a

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif

:inoremap jj <Esc>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
set list

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Enter> :redraw!<CR>

set cursorline
set splitbelow

"copy paste to clipboard
inoremap <C-v> <C-r>=substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','','')<CR>
nnoremap <C-v> "=substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>p

vnoremap <C-c> :'<,'>:w !/mnt/c/Windows/System32/clip.exe<CR><CR>
