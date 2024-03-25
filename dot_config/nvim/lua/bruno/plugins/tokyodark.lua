return {
	"tiagovla/tokyodark.nvim",
	priority = 999,
	opts = {},
	config = function(_, opts)
		require("tokyodark").setup(opts)
		vim.cmd([[ colorscheme tokyodark ]])
	end,
}
