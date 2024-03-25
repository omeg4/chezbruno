return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			{ "*" },
			{
				names = false,
				hsl_fn = true,
				RRGGBBAA = true,
				rgb_fn = true,
			},
		})
	end,
}
