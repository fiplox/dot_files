lua << EOF
require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>',
						{noremap = true, silent = true})
vim.g.mapleader = ' '

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':let @/=""<CR>',
                        {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e',
                        ":Findr<CR>",
                        {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})

-- Findr
vim.api.nvim_set_keymap("n", "<leader><leader>", ":Findr<CR>",
                        {noremap = false, silent = false})

--Clang Format
vim.api.nvim_set_keymap("n", "<leader>c", ":ClangFormat<CR>",
						{noremap = false, silent = false})

-- Search and replace
vim.api.nvim_set_keymap("n", "<leader>r", ":%s///gI<Left><Left><Left><Left>",
						{noremap = false, silent = false})
vim.api.nvim_set_keymap("n", "<leader>R", ":s///gI<Left><Left><Left><Left><Left><Left>",
						{noremap = false, silent = false})
vim.api.nvim_set_keymap("v", "<leader>r", ":s///gI<Left><Left><Left><Left>",
						{noremap = false, silent = false})

-- TODO create entire treesitter section

local mappings = {

    [";"] = "Dashboard",
    ["/"] = "Comment",
    ["h"] = "No Highlight",
	["r"] = "Search and replace all",
	["R"] = "Search and replace",
	["n"] = {"<cmd>:DashboardNewFile<cr>", "Create new file"},
	["\\"] = {"<cmd>:ToggleTerm<cr>", "Toggle Terminal"},
    b = {
        name = "Buffers",
		b = {"<cmd>FindrBuffers<cr>", "List buffers"},
		k = {"<cmd>bd<cr>", "Kill buffer"},
		n = {"<cmd>bn<cr>", "Next buffer"},
		p = {"<cmd>bp<cr>", "Previous buffer"},
    },
	f = {
		name = "Files",
		f = {"<cmd>Files<cr>", "Find Files"},
		r = {"<cmd>History<cr>", "Recently opened files"},
		p = {"<cmd>Findr `dirname $MYVIMRC`<cr>", "Configs"},
		v = {"<cmd>Findr ~/dev/vpatuta.xyz/content/<cr>", "vpatuta.xyz"},
		L = {"<cmd>Lines<cr>", "Lines in loaded buffers"},
		l = {"<cmd>BLines<cr>", "Lines in current buffer"},
		["'"] = {"<cmd>Marks<cr>", "Marks"},
		c = {"<cmd>Commands<cr>", "Commands"},
		w = {"<cmd>Rg<cr>", "Words ripgrep"},
	},
    l = {
        name = "LSP",
		f = {"<cmd>call CocAction('format')<cr>", "Format"},
		i = {"<cmd>call CocAction('runCommand', 'editor.action.organizeImport')<cr>", "Organize Imports"},
		o = {"<cmd>CocList outline<cr>", "Outline"},
		d = {"<Plug>(coc-definition)", "Definition"},
		t = {"<Plug>(coc-type-definition)", "Type definition"},
		r = {"<Plug>(coc-reference)", "Reference"},
    },
	o = {
		name = "Open",
		t = {"<cmd>vnew<cr><cmd>terminal<cr>", "Terminal vertical"},
		T = {"<cmd>new<cr><cmd>terminal<cr>", "Terminal horizontal"},
		c = {"<cmd>Colors<cr>", "Color schemes"},
		o = {"<cmd>Dashboard<cr>", "Dashboard"}
	},
    s = {
        name = "Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"}
    },
	["<TAB>"] = {
		name = "Tab",
		n = {"<cmd>tabn<cr>", "Next"},
		p = {"<cmd>tabp<cr>", "Previous"},
		["1"] = {"1gt", "Go to tab 1"},
		["2"] = {"2gt", "Go to tab 2"},
		["3"] = {"3gt", "Go to tab 3"},
		["4"] = {"4gt", "Go to tab 4"},
		["5"] = {"5gt", "Go to tab 5"},
		["6"] = {"6gt", "Go to tab 6"},
		["7"] = {"7gt", "Go to tab 7"},
		["8"] = {"8gt", "Go to tab 8"},
		["9"] = {"9gt", "Go to tab 9"},
	},
	w = {
		name = "VimWiki",
		i = "Diary Index",
		s = "UI Select",
		t = "Tab Index",
		w = "Index",
		d = "Delete File",
		h = {
			name = "Convert to HTML",
			h = "Convert and Open",
			a = {"<cmd>VimwikiAll2HTML<CR>", "Convert all pages"},
		},
		n = "Goto",
		r = "Rename File",
		["<Space>"] = {
			name = "Diary",
			i = "Generate Links",
			m = "Make Tomorrow Note",
			t = "Tab Make Note",
			w = "Make Note",
			y = "Make Yesterday Note",
		},
	},
}

local wk = require("which-key")
wk.register(mappings, opts)

EOF
