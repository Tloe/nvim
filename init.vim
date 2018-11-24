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
Plug 'fcpg/vim-spotlightify'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax'

call plug#end()

let g:lightline = {
  \   'colorscheme' : 'gruvbox',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
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
set guioptions=e  " Don't use GUI tabline
set termguicolors
set background=dark
set number
set relativenumber
set lazyredraw
set noshowmode " lightline shows insert so no need to show mode
set hidden "Allow hidden buffers
set pastetoggle=<F3>
set mouse=a
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set list
set cursorline
set splitbelow

let g:GPGUseAgent=0
let g:user_emmet_leader_key=','
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDorArrows=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1
let g:gruvbox_invert_tabline=1
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox

" Move line(s) macros
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" tab completion in deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

map <F1> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | vsplit | endif

inoremap jj <Esc>

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <C-n> :bp<CR>
nnoremap <C-m> :bn<CR>

nnoremap <F2> :noh<CR>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

nnoremap <F3> :redraw!<CR>

nnoremap <F10> <C-W>2h
nnoremap <F11> <C-W>2h<C-W>l
nnoremap <F12> <C-w>2l


"copy paste to clipboard
inoremap <C-v> <ESC>"=substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>pi
nnoremap <C-v> =substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>p

vnoremap <C-c> :'<,'>:w !/mnt/c/Windows/System32/clip.exe<CR><CR>
