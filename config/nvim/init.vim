let mapleader="\<Space>"

colorscheme new

source $XDG_CONFIG_HOME/nvim/fzf.vim

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'terrortylor/nvim-comment'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' " Alt + p  to toggle
Plug 'rhysd/vim-clang-format'
Plug 'tikhomirov/vim-glsl'
Plug 'dhruvasagar/vim-table-mode'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'conweller/findr.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'guns/xterm-color-table.vim'

Plug 'folke/which-key.nvim'
Plug 'glepnir/dashboard-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'honza/vim-snippets'

Plug 'airblade/vim-rooter'

call plug#end()

lua << EOF
	require('nvim_comment').setup()
EOF

source $XDG_CONFIG_HOME/nvim/maps.vim
source $XDG_CONFIG_HOME/nvim/settings.vim
source $XDG_CONFIG_HOME/nvim/treesitter.vim
source $XDG_CONFIG_HOME/nvim/whichkey.vim
