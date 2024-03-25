return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 999,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
	end,
}
