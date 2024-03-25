return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		-- Need to download, install, and configure path to official Codeium language server
		-- https://github.com/Exafunction/codeium/releases/tag/language-server-v1.1.32
		-- See also `:h codeium`
	},
	config = function()
		require("codeium").setup({
      config_path = vim.fn.expand("$HOME") .. '/' .. '.codeium/config.json',
      bin_path = vim.fn.expand("$HOME") .. '/' .. '.codeium/bin/',
		})
	end,
}
