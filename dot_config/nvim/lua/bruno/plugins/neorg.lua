return {
	"nvim-neorg/neorg",
  enabled = false,
	-- build = ":Neorg sync-parsers",
	dependencies = {
		"nvim-lua/plenary.nvim",
    "luarocks.nvim"
	},
  lazy = false,
  version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = vim.fn.expand("~") .. "/Documents/brunorg/",
              daily = vim.fn.expand("~") .. "/Documents/brunorg/daily/",
						},
            index = "index.norg",
            autodetect = true,
            autochdir = true,
					},
          default_workspace = "notes",
				},
        ["core.summary"] = {},
        -- ["core.ui.calendar"] = {},
        ["core.qol.toc"] = {},
        ["core.journal"] = {
          config = {
            journal_folder = vim.fn.expand("~") .. "/Documents/brunorg/daily/",
            strategy = "flat",
            template_name = "template_daily.norg",
          },
        },
        ["core.autocommands"] = {},
        ["core.storage"] = {},
			},
		})
	end,
}
