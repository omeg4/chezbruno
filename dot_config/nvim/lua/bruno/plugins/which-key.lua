return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    window = {
      border = "double",
    }
  },
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
