return {
	"romgrk/barbar.nvim",
	version = "^1.0.0",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			icons = {
				buffer_index = true,
				-- buffer_number = true,
			},
			separator = {
				left = "|",
				right = "",
			},
		})
	end,
}
