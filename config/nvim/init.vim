" autocmds
colorscheme d
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType markdown nnoremap <A-1> yypVr=A
autocmd FileType markdown inoremap <A-1> <Esc>yypVr=A
autocmd FileType markdown nnoremap <A-2> yypVr-A
autocmd FileType markdown inoremap <A-2> <Esc>yypVr-A
autocmd FileType markdown inoremap <A-3> <Esc>I### <Esc>A
autocmd FileType markdown inoremap <A-4> <Esc>I#### <Esc>A
autocmd FileType markdown inoremap <A-5> <Esc>I##### <Esc>A
autocmd FileType markdown inoremap <A-u> <Esc>I+<Space><Esc>A
autocmd FileType markdown nnoremap <A-u> <Esc>I+<Space><Esc>A
autocmd FileType markdown inoremap <A-o> <Esc>I1.<Space><Esc>A
autocmd FileType markdown nnoremap <A-o> <Esc>I1.<Space><Esc>A
autocmd FileType markdown nnoremap <Leader>e I<center><Esc>A</center>
autocmd BufWritePre *.rs :call CocAction('format')

function! s:init_fern() abort
	nmap <buffer> H <Plug>(fern-action-open:split)
	nmap <buffer> V <Plug>(fern-action-open:vsplit)
	nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
	nmap <buffer> <leader> <Plug>(fern-action-mark)
	nmap <buffer> s <Plug>(easymotion-overwin-f)
endfunction

augroup fern-custom
	autocmd! *
	autocmd FileType fern call s:init_fern()
augroup END

augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
augroup END

" Lightline config
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'text' ] ]
			\ },
			\ }

" lets
let g:rainbow_active = 1
let mapleader=","
" GO
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
" Easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
" Fern
let g:fern#renderer = "nerdfont"
" C/C++
let g:cpp_attributes_highlight = 1
let g:cpp_member_variable_highlight = 0
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
"let g:cpp_no_function_highlight = 0
" \ "AlignConsecutiveAssignments" : 'true',
" \ "AlignConsecutiveDeclarations" : 'true',
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,
            \ "AllowShortIfStatementsOnASingleLine" : "Never",
			\ "AlignConsecutiveMacros" : 'true',
			\ "AllowShortLoopsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "c++20",
			\ "NamespaceIndentation" : "All",
			\ "IndentWidth" : 4,
			\ "TabWidth" : 4,
            \ "BreakBeforeBraces" : "Linux",
			\ "AllowShortFunctionsOnASingleLine" : "Empty",
			\ "AllowShortBlocksOnASingleLine" : "Never",
			\ "FixNamespaceComments" : "true",
			\ "PointerAlignment" : "Right",
			\ "ColumnLimit" : "120",
			\ "UseTab" : "Always"}

let g:table_mode_header_fillchar='='
let g:table_mode_corner_corner='+'
let g:table_mode_corner='+'

" pop up menu colors



au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert
nnoremap <silent> tt :vnew<CR>:terminal<CR>
nnoremap <silent> = :new<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" nmaps
nmap Q gq
nmap <C-p> <Plug>MarkdownPreviewToggle
nmap cl :ClangFormat<CR>
nmap ; :
nmap <C-c> :ccl <bar> :lclose<CR>
nmap <C-N><C-N> :set nu!<CR>
nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>gl :runtime! syntax/gtk3.vim syntax/glib.vim<CR>
nmap <Leader>k :tabnext<CR>
nmap <Leader>j :tabprevious<CR>
nmap <Leader>s :set spell spelllang=fr<CR>
nmap <A-q> z=
nmap <C-q> :q<CR>
nm <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

" nnoremaps (normal mode maps)
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>ll
nnoremap <silent> <C-Space> :nohlsearch<Bar>:echo<CR>
nnoremap <F9> za
nnoremap <F10> zd
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap ff gg=G
nnoremap <C-s> :s///gI<Left><Left><Left><Left><Left><Left>

xnoremap <leader>p "_dP

" inoremaps (insert mode maps)
inoremap <F9> <C-O>za
"inoremap ;g <++>
"inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <A-q> <Esc>z=
"inoremap <C-n> <C-x><C-o>

" noremaps
noremap <silent> <C-h> :vertical resize +3<CR>
noremap <silent> <C-l> :vertical resize -3<CR>
noremap <silent> <C-k> :resize +3<CR>
noremap <silent> <C-j> :resize -3<CR>
noremap <silent> <C-f> :Fern . -drawer -toggle <CR>

" onoremaps
onoremap <F9> <C-C>za

" vnorepams
vnoremap <F9> zf
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" sets
set guicursor=n-v-c-sm:hor20,i-ci-ve:ver20,r-cr-o:Block
set path=.,,**h
set mouse=v
set tabstop=4 			" tab width is 4 spaces
set shiftwidth=4        " indent also with 4 spaces
set clipboard+=unnamedplus
set encoding=utf-8
set updatetime=300      " Faster completion
set nocompatible
set smartindent
set noshowmode
set smartcase
set laststatus=2
set hlsearch
set cursorline
set splitbelow splitright
set viewoptions=folds,cursor
set sessionoptions=folds
set completeopt-=preview
set pumheight=5
set nu

syntax on
filetype plugin on

function Line()
	if s:white
		hi CursorLine cterm=NONE ctermbg=Black
		let s:white=0
	else
		hi CursorLine cterm=NONE ctermbg=White
		let s:white=1
	endif
endfunction
nmap <Leader>l :call Line()<CR>
let s:white=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
" COC CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
set hidden
set nobackup
set nowritebackup
set shortmess+=c
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <A-space> coc#refresh()

let g:coc_start_at_startup=0
au FileType rust,python,cpp,c,html,htmldjango,go call COC()
au FileType html,htmldjango call coc#config('suggest.autoTrigger', v:true)

function COC()
	:CocStart
	inoremap <silent><expr> <TAB> 
					\ pumvisible() ? "\<C-n>" :
					\ <SID>check_back_space() ? "\<TAB>" :
					\ coc#refresh()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
nmap <A-s> <Plug>NERDCommenterToggle
vmap <A-s> <Plug>NERDCommenterToggle
imap <A-s> <ESC><Plug>NERDCommenterToggle

nmap <F6> :call Toggle_color()<CR>
let s:l=0
function Toggle_color()
	if s:l
		:colorscheme d
		let s:l=0
	else
		:colorscheme l
		let s:l=1
	endif
endfunction


" vim-plug 
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' " Alt + p  to toggle
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tikhomirov/vim-glsl'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()
