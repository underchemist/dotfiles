require("vim._core.ui2").enable({ enable = true })
-- set mapleader
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- plugins
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig", branch = "main" },
	{ src = "https://github.com/mason-org/mason.nvim", branch = "main" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim", branch = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua", branch = "main" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", branch = "main" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", branch = "main" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		name = "nvim-treesitter",
	},
	{ src = "https://github.com/alker0/chezmoi.vim", branch = "main", name = "chezmoi.vim" },
	{ src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("4.x"), name = "nvim-surround" },
	{ src = "https://github.com/mfussenegger/nvim-dap", branch = "main", name = "nvim-dap" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python", branch = "main", name = "nvim-dap-python" },
})

-- config
require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
	"rust",
	"python",
	"markdown",
	"lua",
	"yaml",
})
-- colorscheme
require("catppuccin").setup({
	flavour = "macchiato",
})
-- lsp
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "basedpyright", "yamlls", "ruff", "stylua" },
})
require("fzf-lua").setup()

-- autocmds
-- tree-sitter
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter()
	end,
})

-- markdown formatting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_ca"
		vim.opt_local.breakindent = true
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "toml" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})
-- opts
vim.cmd.colorscheme("catppuccin-nvim")
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.confirm = true
-- vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.iskeyword:append("-") -- include '-' in words
vim.opt.selection = "inclusive"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.shortmess:append("I") -- disable intro
vim.opt.complete = ".,w,b,o"
vim.opt.completeopt = "menuone,noselect,fuzzy"
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 250 -- ms
vim.g.netrw_liststyle = 3 -- tree listing style

-- keymaps
-- fzf-lua
vim.api.nvim_set_keymap("n", " " , [[<Cmd><Nop><CR>]], {})  -- disable move command of <space>
vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-b>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".keymaps()<CR>]], {})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
