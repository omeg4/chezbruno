return {
  'lervag/vimtex',
  -- enabled = false,
  event = {
    "BufReadPre **.tex",
    "BufNewFile **.tex",
    "BufReadPre **.bib",
    "BufNewFile **.bib",
    "BufReadPre **.cls",
    "BufNewFile **.cls",
  },
  -- https://stackoverflow.com/questions/71726911/set-vim-plugin-options-in-a-neovim-init-lua
  config = function()
    vim.g['vimtex_view_method'] = 'zathura'
    vim.g['vimtex_quickfix_mode'] = 0
    vim.g['vimtex_mappings_enabled'] = 1
    vim.g['vimtex_mappings_prefix'] = "<LocalLeader>l"
    vim.g['vimtex_indent_enabled'] = 0
    vim.g['vimtex_syntax_enabled'] = 0 -- Treesitter does this already
    vim.g['vimtex_log_ignore'] = ({
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })
    vim.g['vimtex_enabled'] = 1
    vim.g['vimtex_compiler_enabled'] = 1
    vim.g['vimtex_compiler_method'] = 'latexmk'
    vim.g['vimtex_compiler_latexmk'] = ({
      executable = '/usr/bin/latexmk',
      continuous = 1,
      callback = 1,
      options = {
        '-verbose',
        '-synctex=1',
        '-interaction=nonstopmode',
      }
    })
    vim.g['vimtex_compiler_latexmk_engines'] = ({
      _ = '-xelatex'
    })
  end,
}
