set guicursor=n-v-c-sm:hor20,i-ci-ve:ver20,r-cr-o:Block

set mouse=vn " Enable your mouse
set path=.,,**h
set pumheight=10 " Makes popup menu smaller
set fileencoding=utf-8 " The encoding written to file
"set cmdheight = 2 " More space for displaying messages
set splitbelow " Horizontal splits will automatically be below
set splitright " Vertical splits will automatically be to the right
set ts=4 " Insert 4 spaces for a tab (tabstop)
set sw=4 " Change the number of space characters inserted for indentation (shiftwidth)
set smartindent " Makes indenting smart
"set expandtab " Converts tabs to spaces
"vim.wo.signcolumn = "yes" " Always show the signcolumn, otherwise it would shift the text each time
set noshowmode " We don't need to see things like " INSERT " anymore (noshowmode)
set nobackup " This is recommended by coc (nobackup)
set nowritebackup " This is recommended by coc (nowritebackup)
set undofile
set updatetime=300 " Faster completion
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nocompatible
set smartcase
set hlsearch
set cursorline
set viewoptions=folds,cursor
set sessionoptions=folds
set number
set hidden
set shortmess+=c " Don't pass messages to ins-completion-menu.
set scrolloff=15 " Don't pass messages to ins-completion-menu.

set iskeyword+=- " treat dash separated words as a word text object"
set inccommand=nosplit " Make substitution work in realtime
set conceallevel=0 " So that I can see `` in markdown files
set completeopt=menuone,noselect
set timeoutlen=300
" set noswapfile

syntax on " syntax highlighting
filetype plugin on " filetype detection

autocmd BufReadPost * silent! normal! g`"zz
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert
" au FileType dart,rust,python,cpp,c,html,htmldjango,go call COC()
au FileType html,htmldjango call coc#config('suggest.autoTrigger', v:true)
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert

let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'text' ] ]
			\ },
			\ }


let g:findr_floating_window = 0

let g:cpp_attributes_highlight = 1
let g:cpp_member_variable_highlight = 0
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
"let g:cpp_no_function_highlight = 0
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
			\ "ContinuationIndentWidth" : "2",
			\ "UseTab" : "Always"}

"source `dirname $MYVIMRC`/fzf.vim

" COC
let g:coc_start_at_startup=1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:dahsboard_disable_at_vimenter = 0
let g:dashboard_custom_footer = ['vpatuta.xyz']
let g:dashboard_custom_header = [
\' ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄ ',
\'▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌',
\'▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌ ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌',
\'▐░▌▐░▌    ▐░▌▐░▌          ▐░▌       ▐░▌  ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌',
\'▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌   ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌',
\'▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌    ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌',
\'▐░▌   ▐░▌ ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌     ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌',
\'▐░▌    ▐░▌▐░▌▐░▌          ▐░▌       ▐░▌      ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌',
\'▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌       ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌',
\'▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌        ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌',
\' ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀          ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀ ',
\]

let g:dashboard_custom_section={
  \ 'a': {
      \ 'description': [' Open Findr                            SPC e  '],
      \ 'command': 'Findr' },
  \ 'b': {
      \ 'description': [' Recently Opened Files                 SPC f r'],
      \ 'command': 'History' },
  \ 'c': {
      \ 'description': [' Open Configuration                    SPC f p'],
      \ 'command': 'Findr `dirname $MYVIMRC`' },
  \ 'd': {
      \ 'description': [' Find Word                             SPC f w'],
      \ 'command': 'Rg' },
  \ 'e': {
      \ 'description': [' Load Last Session                     SPC s l'],
      \ 'command': 'SessionLoad' },
  \ 'f': {
      \ 'description': [' Create New File                       SPC n  '],
      \ 'command': 'DashboardNewFile' },
  \ }

let g:table_mode_header_fillchar='='
let g:table_mode_corner_corner='+'
let g:table_mode_corner='+'

"
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_def_mapping_enabled = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_highlight_operators = 1
