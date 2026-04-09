-- plugins
vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mfussenegger/nvim-lint',
        'https://github.com/ibhagwan/fzf-lua',
        'https://github.com/nvim-tree/nvim-web-devicons',
	})

-- config
vim.lsp.enable('pyright')
require('vim._core.ui2').enable({enable=true})
require("mason").setup()
require("lint").linters_by_ft = {
  python = {"ruff", "mypy"}
}
require("fzf-lua").setup()

-- opts
vim.g.mapleader = " "
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true

-- keymaps
-- fzf-lua
vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
