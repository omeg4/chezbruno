local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("bruno.core")

require('which-key').setup()
-- require("catppuccin").load()
local theme_name = "duskfox"
vim.cmd({ cmd = 'colo', args = { theme_name } })
require("lualine").setup({
	options = { theme = theme_name },
})
