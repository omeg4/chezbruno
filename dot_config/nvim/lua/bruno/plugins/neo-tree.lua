return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["e"] = function()
						vim.api.nvim_exec("Neotree focus filesystem left", true)
					end,
					["b"] = function()
						vim.api.nvim_exec("Neotree focus buffers left", true)
					end,
					["g"] = function()
						vim.api.nvim_exec("Neotree focus git_status left", true)
					end,
				},
			},
			keys = {
				{
					"<C-n>",
					function()
						require("neo-tree.command").execute({
							toggle = true,
							source = "filesystem",
							position = "left",
						})
					end,
					desc = "Neotree Filesystem",
				},
			},
			event_handlers = {
				--{
				--  event = "neo_tree_window_before_open",
				--  handler = function(args)
				--    print("neo_tree_window_before_open", vim.inspect(args))
				--  end
				--},
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				--{
				--  event = "neo_tree_window_before_close",
				--  handler = function(args)
				--    print("neo_tree_window_before_close", vim.inspect(args))
				--  end
				--},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_open",
					handler = function()
						vim.cmd([[ set relativenumber ]])
					end,
				},
			},
		})
	end,
}
