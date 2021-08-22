" window movement
nmap <silent><C-h> <C-w>h
nmap <silent><C-j> <C-w>j
nmap <silent><C-k> <C-w>k
nmap <silent><C-l> <C-w>l

" resize
nmap <silent><C-Up> :resize -2<CR>
nmap <silent><C-Down> :resize +2<CR>
nmap <silent><C-Left> :vertical resize -2<CR>
nmap <silent><C-Right> :vertical resize +2<CR>

" indent
vnoremap <silent>< <gv
vnoremap <silent>> >gv

" Move selected line / block of text in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

tnoremap <Esc> <C-\><C-n>

nmap ; :

" Show highlight group
nmap <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

" Open / Close fold
noremap <silent> <CR> @=(foldlevel('.')?'za':"\<Space>")<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

noremap <A-\> :ToggleTerm<CR>
tnoremap <A-\> <c-\><c-n>:ToggleTerm<CR>
inoremap <A-\> <Esc>:ToggleTerm<CR>
vnoremap <A-\> <Esc>:ToggleTerm<CR>
