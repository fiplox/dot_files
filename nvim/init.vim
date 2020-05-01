let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'text' ] ]
      \ },
      \ 'component': {
      \   'text': 'GET SHIT DONE!'
      \ },
      \ }
let g:rainbow_active = 1
set completeopt-=preview 
set clipboard=unnamedplus
set encoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
let mapleader=","
inoremap <PageUp> <C-x><C-o>
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p
set clipboard+=unnamedplus
set timeout timeoutlen=1500
set number
" use indentation of previous line
set autoindent
set noshowmode
" use intelligent indentation for C
set smartindent

" More powerful backspacing
set backspace=indent,eol,start

" show file in titlebar
set title

" configure tabwidth and insert spaces instead of tabs
"set expandtab           " expand tabs to spaces
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4        " indent also with 8 spaces

" search
set incsearch
set ignorecase
set smartcase
set laststatus=2
syntax on

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set cursorline
hi CursorLine cterm=NONE ctermbg=Black
hi Folded ctermbg=Black


call plug#begin()
	
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go'

call plug#end()
