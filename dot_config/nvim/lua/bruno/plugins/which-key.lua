return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
      },
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
    window = {
      border = "double",
    }
  },
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
