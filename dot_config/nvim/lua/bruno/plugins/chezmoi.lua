return {
  'xvzc/chezmoi.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('chezmoi').setup({})
  end,
  opts = {
    edit = {
      watch = false,  -- set true to auto-apply on save
      force = false,
    },
    events = {
      on_open = {
        notification = { enable = true, msg = "Opened a chezmoi-managed file" },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { vim.env.HOME .. "/.local/share/chezmoi/*" },
      callback = function()
        vim.schedule(require("chezmoi.commands.__edit").watch)
      end,
    })
  end,
}
