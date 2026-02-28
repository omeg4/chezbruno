return {
  'xvzc/chezmoi.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('chezmoi').setup({
      edit = {
        watch = false,
        force = false,
        ignore_patterns = {
          "run_onchange_.*",
          "run_once_.*", 
          "%.chezmoiignore",
          "%.chezmoitemplate",
          -- Add custom patterns here
        },
      },
      events = {
        on_open = {
          notification = {
            enable = true,
            msg = "Opened a chezmoi-managed file",
            opts = {},
          },
        },
        on_watch = {
          notification = {
            enable = true,
            msg = "This file will be automatically applied",
            opts = {},
          },
        },
        on_apply = {
          notification = {
            enable = true,
            msg = "Successfully applied",
            opts = {},
          },
        },
      },
      telescope = {
        select = { "<CR>" },
      },
    })
  end,
}
