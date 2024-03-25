return {
	"ggandor/leap.nvim",
	enabled = false,
	keys = {
		{ "<leader>s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
		{ "<leader>S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
		{ "<leader>gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
	},
	config = function(_, opts)
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		leap.add_default_mappings(false)
		vim.keymap.del({ "x", "o" }, "x")
		vim.keymap.del({ "x", "o" }, "X")
	end,
}
