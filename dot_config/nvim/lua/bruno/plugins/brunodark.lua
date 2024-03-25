return {
  { -- navarasu/onedark.nvim
    "navarasu/onedark.nvim", -- TODO: Figure out how to configure `lualine` to match
    name = 'brunodark',
    enabled = false,
    opts = {
      -- Main options --
      style = 'deep',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false,          -- Show/hide background
      term_colors = true,           -- Change terminal color as per the selected theme style
      ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = "<leader>ts",                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = 'italic',
        -- keywords = 'none',
        keywords = 'italic,bold',
        functions = 'bold',
        strings = 'none',
        variables = 'none'
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {
        fg          = '#DDDDDD',
        black       = "#003041",
        bg0         = "#030A1A", -- Window Background
        bg1         = "#061B3A", -- Current Line Color
        bg2         = "#012011",
        bg3         = "#00191D",
        bg_d        = "#061B3A", -- BG Color of sidebars e.g. NvimTree File Explorer. Named for 'Diagnostic' Window Background, maybe?
        bg_blue     = "#074747",
        bg_yellow   = "#f2cc81",
        red         = '#F19298',
        dark_red    = "#FF2E34",
        orange      = '#FF7132',
        yellow      = '#FAC1A4',
        dark_yellow = "#FDAE76",
        green       = '#07CD56',
        cyan        = '#128FA3',
        dark_cyan   = "#004451",
        blue        = '#0372A0',
        purple      = '#736296',
        dark_purple = "#4F2958",
        grey        = '#AAAAAA',
        light_grey  = '#777777',
        diff_add    = "#005423",
        diff_delete = "#D50F4A",
        diff_change = "#FF7132",
        diff_text   = "#DDDDDD",
      }, -- Override default colors
      highlights = {
        -- ["@keyword"] = {fg = "$green"},
        ["@string"] = { fg = "$dark_yellow" },
        ["@comment"] = { fg = "$purple" },
      }, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true,     -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
}
