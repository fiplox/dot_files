" Lightline config
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
" lets
let g:rainbow_active = 1
let mapleader=","
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" pop up menu colors
highlight Pmenu ctermbg=55 ctermfg=15
highlight PmenuSbar ctermbg=White
highlight PmenuThumb ctermbg=White

" maps
map <Leader>tt :vnew term://fish<CR> 

" nmaps
nmap ; : 
nmap <C-c> :ccl <bar> :lclose<CR>
nmap <C-N><C-N> :set nu! rnu!<CR>

" nnoremaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" noremaps
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" sets
set autoindent
set nu rnu
"set expandtab           " expand tabs to spaces
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4        " indent also with 8 spaces
"set completeopt-=preview 
set clipboard+=unnamedplus
set encoding=utf-8
set updatetime=300                      " Faster completion
set nocompatible
set autoindent
set noshowmode
set smartcase
set laststatus=2
set hlsearch
set cursorline
set splitbelow splitright

syntax on
filetype plugin on
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

" vim-plug 
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdcommenter'
Plug 'lilydjwg/colorizer'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
