return {
	"olimorris/onedarkpro.nvim",
	enabled = false,
	priority = 1002,
	opts = {},
	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd([[ colorscheme onedark_vivid ]])
	end,
}
