-- set mapleader
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- plugins
vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
        'https://github.com/ibhagwan/fzf-lua',
        'https://github.com/nvim-tree/nvim-web-devicons',
        { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
        { src=  "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", name = "nvim-treesitter"},
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
    flavour = 'macchiato'
})
-- lsp
vim.lsp.enable('pyright')
vim.lsp.enable("yamlls")
require('vim._core.ui2').enable({enable=true})
require("mason").setup()
require("fzf-lua").setup()

-- autocmds
-- tree-sitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'<filetype>'},
    callback = function() vim.treesitter() end,
})

-- opts
vim.cmd.colorscheme  "catppuccin-nvim"
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

-- keymaps
-- fzf-lua
vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
