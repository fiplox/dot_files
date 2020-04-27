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
set clipboard=unnamedplus
set encoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
let mapleader=","
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

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
