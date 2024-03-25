local vim = vim
local opt = vim.opt

vim.g.mapleader = " "

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.cursorcolumn = false

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- :h nvim-cmp
-- `nvim-cmp` does not work with `set paste` option
opt.paste = false

-- Set this for toggleterm
opt.hidden = true

-- NOTE: 12/11/23
-- set this option for nvim-treesitter
vim.g.skip_ts_context_commentstring_module = true
