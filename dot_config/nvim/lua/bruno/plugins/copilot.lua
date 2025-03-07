return {
  'zbirenbaum/copilot.lua',
  cmd = "Copilot",
  enabled = false,
  event = "InsertEnter",
  config = function ()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "<C-p>",
          jump_next = "<C-n>",
          accept = "<CR>",
          refresh = "gr",
          open = "<C-o>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = false, -- set to false to avoid conflict with nvim-cmp
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-h>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        -- ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
  })
  end
}
