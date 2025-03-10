local vim = vim

-- vim.g.mapleader = " "
-- Just set this here instead of in nvim/after/ftplugin/tex.lua
-- vim.g.maplocalleader = "\\"

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

wk.add({ -- icon-picker.nvim Normal Mode
  { "<leader>i", group = "IconPicker" },
  { "<leader>i<C-i>", desc = "Insert Mode: :IconPickerInsert" },
  { "<leader>ii", "<cmd>IconPickerNormal<CR>", desc = "[I]nsert icon with :IconPickerNormal" },
  { "<leader>iy", "<cmd>IconPickerYank<CR>", desc = "[Y]ank icon with :IconPickerYank" },
})

wk.add({ -- icon-picker.nvim Insert Mode
  { mode = "i" },
  { "<C-i>", group = "+IconPickerInsert" },
  { "<C-i>e", "<cmd>IconPickerInsert emoji nerd_font alt_font symbols<CR>", desc = "Insert emoji nerd_font alt_font symbols" },
  { "<C-i>i", "<cmd>IconPickerInsert<CR>", desc = ":IconPickerInsert" },
  { "<C-i>n", "<cmd>IconPickerInsert nerd_font emoji<CR>", desc = "Insert nerd_font emoji" },
  { "<C-i>s", "<cmd>IconPickerInsert alt_font symbols<CR>", desc = "Insert alt_font symbols" },
})

wk.add({ -- <leader>p - Plugin Management
  { "<leader>p", group = "+Plugin Management" },
  { "<leader>pl", "<cmd>Lazy<CR>", desc = "Open Lazy UI" },
  { "<leader>pm", "<cmd>Mason<CR>", desc = "Open Mason UI" },
  -- { "<leader>pr", "<cmd>luafile " .. vim.fn.expand("~") .. "/.config/nvim/init.lua<CR>", "Source init.lua" },
  { "<leader>pn",
      function()
        local filename_input = vim.fn.input("Enter plugin <name>.lua: ") .. ".lua"
        local plugin_path = vim.fn.expand("~") .. "/.config/nvim/lua/bruno/plugins/" .. filename_input
        vim.cmd( { cmd = 'edit', args = { plugin_path } } )
      end,
      desc = "Add new <name>.lua file to plugins/ folder" },
})

wk.add({ -- <leader>g - LazyGit
  { "<leader>g", group = "+LazyGit" },
  { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open :Lazy[g]it" },
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
wk.add({ -- , - Hop: easymotion-like movement
  { ",", group = "+Hop motions" },
  { ",f", "<cmd>HopChar1<CR>", desc = "[F]ind by 1 char", },
  { ",F", "<cmd>HopChar2<CR>", desc = "[F]ind by 2 chars", },
  { ",w", "<cmd>HopWord<CR>", desc = "Hop to another [w]ord ( ) " },
  { ",,", "<cmd>HopNodes<CR>", desc = "Hop between Treesitter nodes (<->) " },
  { ",t", function()
    hop.hint_char1({
      direction = directions.AFTER_CURSOR,
      hint_offset = 1,
      current_line_only = false,
    })
  end, desc = "Hop forwards [t]o 1 char target" },
  { ",T", function()
    hop.hint_char1({
      direction = directions.BEFORE_CURSOR,
      hint_offset = -1,
      current_line_only = false,
    })
  end, desc = "Hop backwards [t]o 1 char target" },
    -- How to add functions for cut/delete actions like `c`?
})

wk.add({ -- <leader>u - Get info about glyphs, symbols, and digraphs using unicode.vim
  { "<leader>u", group = "Unicode.vim" },
  { "<leader>uS", "<cmd>UnicodeSearch!<CR>", desc = "Unicode [s]earch and add[!] at current cursor position" },
  { "<leader>ub", "<F4>", desc = "Unicode [b]rowse" },
  { "<leader>ud", "<cmd>Digraphs<CR>", desc = "Search for Digraphs" },
  { "<leader>ug", desc = "INSERT MODE: <C-x><C-g> - Complete digraph char (e.g. *X<C-x><C-g>)" },
  { "<leader>un", "<cmd>UnicodeName<CR>", desc = "Unicode Name" },
  { "<leader>us", "<cmd>UnicodeSearch<CR>", desc = "Unicode [s]earch" },
  { "<leader>ut", "<cmd>UnicodeTable<CR>", desc = "Unicode Table" },
  { "<leader>uz", desc = "INSERT MODE: <C-x><C-z> - Complete Unicode char (e.g. U+00d7<C-x><C-z>)" },
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
wk.add({
  { "<leader>b", group = "barbar.lua" },
  { "<leader>b0", "<cmd>BufferLast<CR>", desc = "Goto Last Buffer" },
  { "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Goto Buffer [1]" },
  { "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Goto Buffer [2]" },
  { "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Goto Buffer [3]" },
  { "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Goto Buffer [4]" },
  { "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Goto Buffer [5]" },
  { "<leader>b6", "<cmd>BufferGoto 6<CR>", desc = "Goto Buffer [6]" },
  { "<leader>b7", "<cmd>BufferGoto 7<CR>", desc = "Goto Buffer [7]" },
  { "<leader>b8", "<cmd>BufferGoto 8<CR>", desc = "Goto Buffer [8]" },
  { "<leader>b9", "<cmd>BufferGoto 9<CR>", desc = "Goto Buffer [9]" },
  { "<leader>b<", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer (<-)" },
  { "<leader>b>", "<cmd>BufferMoveNext<CR>", desc = "Move buffer (->)" },
  { "<leader>bc", "<cmd>BufferPick<CR>", desc = "[C]hoose buffer by index" },
  { "<leader>bk", "<cmd>BufferClose<CR>", desc = "[K]ill buffer" },
  { "<leader>bn", "<cmd>BufferNext<CR>", desc = "Go to Next buffer" },
  { "<leader>bp", "<cmd>BufferPrevious<CR>", desc = "Go to previous buffer" },
})
map("n", "[b", "<cmd>BufferPrevious<CR>", { desc = "Go to previous [b]uffer" })
map("n", "]b", "<cmd>BufferNext<CR>", { desc = "Go to next [b]uffer" })
-- }}}

-- Conform.nvim
map({ "n", "v" }, "<leader>md", "<cmd>FormatDisable<CR>", { desc = "Disable autoformat-on-save" })

map({ "n", "v" }, "<leader>me", "<cmd>FormatEnable<CR>", { desc = "Enable autoformat-on-save" })

-- toggleterm.nvim
wk.add({
  { "<leader>t", group = "toggleterm" },
  { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle [t]erminal" },
})

-- noice.nvim
wk.add({
  { "<leader>nn", "<cmd>NoiceHistory<CR>", desc = "Open :[N]oiceHistory" },
  { "<leader>nf", "<cmd>NoiceTelescope<CR>", desc = "Open :NoiceTelescope [f]inder" },
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

