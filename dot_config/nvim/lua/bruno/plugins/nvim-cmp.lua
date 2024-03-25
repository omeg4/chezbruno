return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
    -- lsp
    "neovim/nvim-lspconfig",
		"onsails/lspkind.nvim", -- vs-code like pictograms
    -- auto complete
    "hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "micangl/cmp-vimtex",
    { "Exafunction/codeium.nvim", config = true },
    -- snippets
    'L3MON4D3/LuaSnip', -- Keep it simple like in Josean's vid?
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
    { "zbirenbaum/copilot-cmp", config = true },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		---@diagnostic disable: redundant-parameter, missing-fields
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
      enabled = true,
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-l>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", group_index = 1 },
        { name = "copilot", group_index = 2 },
				{ name = "codeium", group_index = 2 },
        { name = "nvim_lua", group_index = 3 },
				{ name = "luasnip", group_index = 3 }, -- snippets
				{ name = "path", group_index = 10 }, -- file system paths
				{ name = "buffer", group_index = 20 }, -- text within current buffer
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
          preset = "default",
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = {
            Codeium = "",
          },
				}),
			},
		})

    cmp.setup.filetype("tex", {
      sources = {
        { name = "vimtex" },
        { name = "codeium" },
        { name = "buffer" },
      }
    })

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
        { name = "cmdline", group_index = 1 },
				{ name = "path", group_index = 2 },
			}),
		})

	end,
}
