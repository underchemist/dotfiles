-- plugins
vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mfussenegger/nvim-lint'
	})

-- config
vim.lsp.enable('pyright')
require('vim._core.ui2').enable({enable=true})
require("mason").setup()
require("lint").linters_by_ft = {
  python = {"ruff", "mypy"}
}

-- opts
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.confirm = true
