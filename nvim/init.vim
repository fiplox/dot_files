set nu rnu
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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0

"Popup menu colors
highlight Pmenu ctermbg=55 ctermfg=15
highlight PmenuSbar ctermbg=White
highlight PmenuThumb ctermbg=White
nmap ; :
set autoindent
"set completeopt-=preview 
set clipboard+=unnamedplus
set encoding=utf-8
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
" disable vi compatibility (emulation of old bugs)
set nocompatible
let mapleader=","
inoremap <PageUp> <C-x><C-o>
nnoremap <C-c> :ccl <bar> :lclose<CR>
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p
nmap <C-N><C-N> :set nu! rnu!<CR>
set clipboard+=unnamedplus
set timeout timeoutlen=1500
"set number
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
filetype plugin on

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set cursorline
hi CursorLine cterm=NONE ctermbg=Black
hi Folded ctermbg=Black
""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
"COC CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
set hidden
set nobackup
set nowritebackup
"set cmdheight=2
set updatetime=300
set shortmess+=c
"set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"FOR COLORIZER
"lua require'colorizer'.setup()
"set termguicolors

call plug#begin()
	
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lilydjwg/colorizer'
Plug 'preservim/nerdtree'

"Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

noremap <C-e> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" open terminal inside vim
map <Leader>tt :vnew term://fish<CR> 
" focus vim window only with ctrl+{h,j,k,l}
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


map <Leader>vv :vs<CR>
set splitbelow splitright

