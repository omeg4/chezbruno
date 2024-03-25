local vim = vim

vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		if opts.desc then
			opts.desc = "keymaps.lua: " .. opts.desc
		end
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- Use WhichKey mappings
-- TODO: figure out how to use <expr> in mappings lol
local wk = require("which-key")

wk.register({ -- icon-picker.nvim Normal Mode
  ["<leader>i"] = {
    name = "+IconPicker",
    i = { "<cmd>IconPickerNormal<CR>", "[I]nsert icon with :IconPickerNormal" },
    y = { "<cmd>IconPickerYank<CR>", "[Y]ank icon with :IconPickerYank" },
    ["<C-i>"] = { "Insert Mode: :IconPickerInsert" },
  }
})

wk.register({ -- icon-picker.nvim Insert Mode
  ["<C-i>"] = {
    name = "+IconPickerInsert",
    i = { "<cmd>IconPickerInsert<CR>", ":IconPickerInsert" },
    s = { "<cmd>IconPickerInsert alt_font symbols<CR>", "Insert alt_font symbols" },
    n = { "<cmd>IconPickerInsert nerd_font emoji<CR>", "Insert nerd_font emoji" },
    e = { "<cmd>IconPickerInsert emoji nerd_font alt_font symbols<CR>", "Insert emoji nerd_font alt_font symbols" },
  }, { mode = "i" }
})

wk.register({ -- <leader>p - Plugin Management
  ["<leader>p"] = {
    name = "+Plugin Management",
    l = { "<cmd>Lazy<CR>", "Open Lazy UI" },
    m = { "<cmd>Mason<CR>", "Open Mason UI" },
    -- r = { "<cmd>luafile " .. vim.fn.expand("~") .. "/.config/nvim/init.lua<CR>", "Source init.lua" },
    n = {
      function()
        local filename_input = vim.fn.input("Enter plugin <name>.lua: ") .. ".lua"
        local plugin_path = vim.fn.expand("~") .. "/.config/nvim/lua/bruno/plugins/" .. filename_input
        vim.cmd( { cmd = 'edit', args = { plugin_path } } )
      end,
      "Add new <name>.lua file to plugins/ folder" },
  },
})

wk.register({ -- <leader>g - LazyGit
  ["<leader>g"] = {
    name = "+LazyGit",
    g = { "<cmd>LazyGit<CR>", "Open :Lazy[g]it" },
  }
})

local hop = require("hop")
local directions = require("hop.hint").HintDirection
-- TODO: Figure out how to call these functions w/in keymap definitions.
-- Currently the function appears to be evaluated when `keymaps.lua` is sourced, so our config breaks
local function hft( dir, pos, hop_target )
  local cursor_dir
  if dir == 1 then cursor_dir = directions.AFTER_CURSOR else cursor_dir = directions.BEFORE_CURSOR end
  if hop_target == 1 then
    hop.hint_char1({
      direction = cursor_dir,
      hint_offset = pos,
      current_line_only = false
    })
  elseif hop_target == 2 then
    hop.hint_char2({
      direction = cursor_dir,
      hint_offset = pos,
      current_line_only = false
    })
  elseif hop_target == 'w' then
    hop.hint_words({
      hint_offset = 0,
      current_line_only = false
    })
  else vim.notify( "bad args!", vim.log.levels.ERROR )
  end
end

-- TODO: SURELY there's a more compact and repeatable way to set these keybinds up...
wk.register({ -- , - Hop: easymotion-like movement
  [","] = {
    name = "+Hop motions",
    f = { "<cmd>HopChar1<CR>", "[F]ind by 1 char", },
    F = { "<cmd>HopChar2<CR>", "[F]ind by 2 chars", },
    t = { function()
      hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        hint_offset = 1,
        current_line_only = false,
      })
    end, "Hop forwards [t]o 1 char target" },
    T = { function()
      hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        hint_offset = -1,
        current_line_only = false,
      })
    end, "Hop backwards [t]o 1 char target" },
    w = { "<cmd>HopWord<CR>", "Hop to another [w]ord ( ) " },
    [","] = { "<cmd>HopNodes<CR>", "Hop between Treesitter nodes (<->) " },
    -- How to add functions for cut/delete actions like `c`?
  }
})

wk.register({ -- <leader>u - Get info about glyphs, symbols, and digraphs using unicode.vim
  ["<leader>u"] = {
    name = '+Unicode.vim',
    n = { "<cmd>UnicodeName<CR>", "Unicode Name" },
    t = { "<cmd>UnicodeTable<CR>", "Unicode Table" },
    d = { "<cmd>Digraphs<CR>", "Search for Digraphs" },
    s = { "<cmd>UnicodeSearch<CR>", "Unicode [s]earch" },
    S = { "<cmd>UnicodeSearch!<CR>", "Unicode [s]earch and add[!] at current cursor position" },
    g = "INSERT MODE: <C-x><C-g> - Complete digraph char (e.g. *X<C-x><C-g>)",
    z = "INSERT MODE: <C-x><C-z> - Complete Unicode char (e.g. U+00d7<C-x><C-z>)",
    b = { "<F4>", "Unicode [b]rowse" },
  }
})

-- wk.register({
--   ["<leader>w"] = {
--     name = '+Vimwiki',
--   }
-- })

map("n", ";", ":", { silent = false, remap = false, desc = "Nvim Command Mode" })
-- map("n", "<C-n>", "<cmd>Neotree<CR>", { remap = false, desc = "Toggle Neotree" })
-- map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { remap = false, desc = "Toggle Neotree" })
map({ "n", "v" }, "L", "Lzz", { desc = "Scroll down by one-half window height and center cursor" })
map({ "n", "v" }, "H", "Hzz", { desc = "Scroll up by one-half window height and center cursor" })

map("n", "<C-q>", "<C-w>q", { desc = "Close window" })


-- FROM telescope.lua
-- set keymaps
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--



-- Easier resizing of panes
map({ "n", "i", "v" }, "<C-Up>"     , "<cmd>resize +1<CR>"         , { desc = "Increase window height by 1", remap = false })
map({ "n", "i", "v" }, "<C-Down>"   , "<cmd>resize -1<CR>"         , { desc = "Decrease window height by 1", remap = false })
map({ "n", "i", "v" }, "<C-Right>"  , "<cmd>vertical resize +1<CR>", { desc = "Increase window width by 1" , remap = false })
map({ "n", "i", "v" }, "<C-Left>"   , "<cmd>vertical resize -1<CR>", { desc = "Decrease window width by 1" , remap = false })

map({ "n", "i", "v" }, "<C-S-Up>"   , "<cmd>resize +5<CR>"         , { desc = "Increase window height by 5", remap = false })
map({ "n", "i", "v" }, "<C-S-Down>" , "<cmd>resize -5<CR>"         , { desc = "Decrease window height by 5", remap = false })
map({ "n", "i", "v" }, "<C-S-Right>", "<cmd>resize vertical +5<CR>", { desc = "Increase window width by 5" , remap = false })
map({ "n", "i", "v" }, "<C-S-Left>" , "<cmd>resize vertical -5<CR>", { desc = "Decrease window width by 5" , remap = false })

-- barbar.lua {{{
wk.register({
  ["<leader>b"] = {
    name = '+barbar.lua',
    c = { "<cmd>BufferPick<CR>", "[C]hoose buffer by index" },
    k = { "<cmd>BufferClose<CR>", "[K]ill buffer" },
    p = { "<cmd>BufferPrevious<CR>", "Go to previous buffer" },
    n = { "<cmd>BufferNext<CR>", "Go to Next buffer" },
    ["<"] = { "<cmd>BufferMovePrevious<CR>", "Move buffer (<-)" },
    [">"] = { "<cmd>BufferMoveNext<CR>", "Move buffer (->)" },

    ["1"] = { "<cmd>BufferGoto 1<CR>", "Goto Buffer [1]" },
    ["2"] = { "<cmd>BufferGoto 2<CR>", "Goto Buffer [2]" },
    ["3"] = { "<cmd>BufferGoto 3<CR>", "Goto Buffer [3]" },
    ["4"] = { "<cmd>BufferGoto 4<CR>", "Goto Buffer [4]" },
    ["5"] = { "<cmd>BufferGoto 5<CR>", "Goto Buffer [5]" },
    ["6"] = { "<cmd>BufferGoto 6<CR>", "Goto Buffer [6]" },
    ["7"] = { "<cmd>BufferGoto 7<CR>", "Goto Buffer [7]" },
    ["8"] = { "<cmd>BufferGoto 8<CR>", "Goto Buffer [8]" },
    ["9"] = { "<cmd>BufferGoto 9<CR>", "Goto Buffer [9]" },
    ["0"] = { "<cmd>BufferLast<CR>", "Goto Last Buffer" },
  }
})
map("n", "[b", "<cmd>BufferPrevious<CR>", { desc = "Go to previous [b]uffer" })
map("n", "]b", "<cmd>BufferNext<CR>", { desc = "Go to next [b]uffer" })
-- }}}

-- Conform.nvim
map({ "n", "v" }, "<leader>md", "<cmd>FormatDisable<CR>", { desc = "Disable autoformat-on-save" })

map({ "n", "v" }, "<leader>me", "<cmd>FormatEnable<CR>", { desc = "Enable autoformat-on-save" })

-- toggleterm.nvim
wk.register({
  ["<leader>t"] = {
    name = "+toggleterm",
    t = { "<cmd>ToggleTerm<CR>", "Toggle [t]erminal" },
  }
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map( 't', '<esc>', [[ <C-t> ]], opts )
  map( 't', 'jk', [[ <C-t> ]], opts )
  map( 't', '<C-h>', [[<cmd>wincmd h<CR>]], opts )
  map( 't', '<C-j>', [[<cmd>wincmd j<CR>]], opts )
  map( 't', '<C-k>', [[<cmd>wincmd k<CR>]], opts )
  map( 't', '<C-l>', [[<cmd>wincmd l<CR>]], opts )
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

