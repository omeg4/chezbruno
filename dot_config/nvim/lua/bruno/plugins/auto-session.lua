return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    ---@diagnostic disable: missing-fields
    auto_session.setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    -- keymap.set("n", "<leader>wm", function()
    --   local user_input = vim.fn.input("Enter View name: ")
    --   local command = "<cmd>mkview " .. user_input .. "<CR>"
    --   return command
    -- end,
    --   { desc = "Save current view with given file name", remap = false })
  end,
}
