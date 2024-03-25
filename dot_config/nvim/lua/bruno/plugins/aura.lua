return {
	"baliestri/aura-theme",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	priority = 999,
	config = function(plugin)
		vim.opt.rtp:append(plugin.dir .. "packages/neovim")
	end,
}
