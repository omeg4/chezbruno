return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    { "xubury/emmylua.nvim" },
  },
  lazy = false,
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dap.defaults.fallback.terminal_win_cmd = 'tabnew'
    dap.defaults.python.terminal_win_cmd = 'belowright new'
    dap.defaults.java.auto_continue_if_many_stopped = false

    dap.defaults.fallback.external_terminal = {
      command = "/usr/bin/wezterm"
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set( "n", "<Leader>dc", dap.continue, { desc = "[C]ontinue debugging" } )
    vim.keymap.set( "n", "<Leader>ds", dap.step_over, { desc = "[S]tep over" } )
    vim.keymap.set( "n", "<Leader>di", dap.step_into, { desc = "Step [i]nto" } )
    vim.keymap.set( "n", "<Leader>do", dap.step_out, { desc = "Step [o]ut" } )
    vim.keymap.set( "n", "<Leader>dt", dap.toggle_breakpoint, { desc = "[T]oggle nvim-dap breakpoint" } )
    vim.keymap.set( "n", "<Leader>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Set breakpoint with [l]og message" } )
    vim.keymap.set( "n", "<Leader>dp", dap.repl.open, { desc = "Open RE[P]L" } )
    vim.keymap.set( "n", "<Leader>dr", dap.run_last, { desc = "[R]un last" } )

    vim.keymap.set( { "n", "v" }, "<Leader>dh", function()
      dap.ui.widgets.hover()
    end, { desc = "Open [h]over widget" } )

    vim.keymap.set( { "n", "v" }, "<Leader>dp", function()
      dap.ui.widgets.preview()
    end, { desc = "Open [p]review widget" } )

    vim.keymap.set( "n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float( widgets.frames )
    end, { desc = "Open [f]rames widget" } )

    vim.keymap.set( "n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float( widgets.scopes )
    end, { desc = "Open [s]copes widget" } )

    -- local emmylua = require("emmylua")
    -- dap.adapters.lua = emmylua.get_attach_adapter()

    -- dap.configurations.lua = {
    --   {
    --     name = "Attach EmmyLua Process",
    --     type = "lua",
    --     codePaths = { "${workspaceFolder}" },
    --     request = "attach",
    --     pid = require("dap.utils").pick_process,
    --     ext = { ".lua" }
    --   }
    -- }

    -- dap.adapters["local-lua"] = {
    dap.adapters.lua = {
      type = "executable",
      command = "local-lua-dbg",
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- Use `yay -Ql <pkgname> to list installed files`
          -- e.g. `yay -Ql local-lua-debugger-vscode-git | grep -ai debugAdapter`
          c.extensionPath = "/usr/lib/node_modules/local-lua-debugger-vscode/"
          on_config(c)
        else
          on_config(config)
        end
      end
    }

    dap.configurations.lua = {
      {
        name = 'Attach local-lua-debugger-vscode',
        type = 'lua',
        codePaths = { "${workspaceFolder}" },
        request = "attach",
        pid = require("dap.utils").pick_process,
        ext = { ".lua" }
      }
    }

    -- local wk = require("which-key")
    -- wk.register({ -- nvim-dap
    --   ["<leader>d"] = { name = "+nvim-dap",
    --     t = { function() dap.toggle_breakpoint end, "Toggle Breakpoint" },
    --     c = { function() dap.continue end, "Continue" },
    --   }, { mode = "n" }
    -- })
  end,
}
