return {
	"akinsho/toggleterm.nvim",
	version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      insert_mappings = true,
      terminal_mappings = true,
      hide_numbers = false,
      close_on_exit = false,
    })
  end,
}
