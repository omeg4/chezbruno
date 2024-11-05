return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- local trouble = require("trouble.providers.telescope")
    -- `open_with_trouble` is deprecated, instead use:
    local trouble = require("trouble.sources.telescope")
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-t>"] = trouble.open,
            ["<C-v>"] = actions.file_split,
            ["<C-i>"] = actions.file_vsplit,
					},
					n = {
						["<C-t>"] = trouble.open,
            ["<C-v>"] = actions.file_split,
            ["<C-i>"] = actions.file_vsplit,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
