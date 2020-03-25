call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'nvie/vim-flake8'
Plug 'Kuniwak/vint'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'kien/ctrlp.vim'
Plug 'mgee/lightline-bufferline'
Plug 'qpkorr/vim-bufkill'
Plug 'fcpg/vim-spotlightify'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/yajs.vim'
Plug 'chemzqm/vim-jsx-improve'

"Plug 'terryma/vim-multiple-cursors'

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
set list
set cursorline
set splitbelow
set noswapfile
set backupcopy=yes
set autoread
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

let g:fourSpaceTab = 1
function! ToggleIndent()
    if g:fourSpaceTab
        set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
        let g:fourSpaceTab = 0
    else
        set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
        let g:fourSpaceTab = 1
    endif
endfunction
command! ToggleIndentation call ToggleIndent()
autocmd FileType javascript ToggleIndent

let g:GPGUseAgent=0
let g:user_emmet_leader_key=','
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDorArrows=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1
let g:gruvbox_invert_tabline=1
let g:gruvbox_contrast_dark='hard'
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1

colorscheme gruvbox

"multiple cursor keys
"let g:multi_cursor_use_default_mapping=0

" Default mapping
"let g:multi_cursor_start_word_key      = '<C-s>'
"let g:multi_cursor_select_all_word_key = '<A-s>'
"let g:multi_cursor_start_key           = 'g<C-s>'
"let g:multi_cursor_select_all_key      = 'g<A-s>'
"let g:multi_cursor_next_key            = '<C-s>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'

" Move line(s) macros
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" tab completion in deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd StdinReadPre * let s:std_in=1
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

nnoremap <C-n> :bp<CR>
nnoremap <C-m> :bn<CR>

nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

map <F1> :NERDTreeToggle<CR>
imap <F1> <esc>:NERDTreeToggle<CR>
nnoremap <F2> :noh<CR>
nnoremap <F4> :redraw!<CR>
nnoremap <F7> :cp<CR>zz
nnoremap <F8> :cn<CR>zz
nnoremap <F9> :exe ':silent !firefox --new-window %'<CR>
nnoremap <F10> <C-W><C-L>:vert rightb copen 100<cr><C-w>=
nnoremap <F11> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap <F12> <C-w><C-w>

nnoremap <leader>l :ls<CR>:b<space>
nnoremap <Leader>cp caw/*<C-v><Esc>pa*/<C-v><Esc>/[,)]<C-v><C-m>nb
nnoremap <leader>ct :!exctags -R -f ./.git/tags Code/
nnoremap <leader>rm :call delete(expand('%:p'))

nnoremap <Leader>s :%s/<C-r><C-w>/
"command! -nargs=1 -complete=file GREP execute "vimgrep /" . expand("<cword>") . "/j <args>/**" <Bar> cw<CR>
function! GrepWordUnderCursor()
    let wordUnderCursor = expand('<cword>')
    call inputsave()
    let grepFor = input('Grep for: ', wordUnderCursor)
    call inputrestore()
    call inputsave()
    let folder = input({'prompt': 'In folder: ', 'default': '.', 'completion': 'file'})
    call inputrestore()
    execute "vimgrep /" . grepFor . "/j " . folder . "/**"
endfunction
nnoremap <Leader>gc :call GrepWordUnderCursor()<cr>

nmap . [
nmap - ]
omap . [
omap - ]
xmap . [
xmap - ]

"copy paste to clipboard
if has('win32')
    inoremap <C-v> <ESC>"=substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>pi
    nnoremap <C-v> =substitute(substitute(system('powershell.exe Get-ClipBoard'),'[\r\n]*$','',''), '\r', '', 'g')<CR>p
    vnoremap <C-c> :'<,'>:w !/mnt/c/Windows/System32/clip.exe<CR><CR>
endif

" " Copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>Y "+yg_
nnoremap  <leader>y "+y
nnoremap  <leader>yy "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

:set makeprg=make\ -C\ build 
