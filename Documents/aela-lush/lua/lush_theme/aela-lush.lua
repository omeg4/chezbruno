--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl
local aela = require("lua/lush_theme/aela-palette")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups

		Normal            { bg = aela.sky.skyvdblue,          fg =  aela.bnw.snow }, -- Normal text
		-- ColorColumn    {}, -- Columns set with 'colorcolumn'
		-- Conceal        {}, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor            { bg = aela.sky.skyblue,            fg =  aela.bnw.snow }, -- Character under the cursor
		CurSearch         { bg = aela.sea.seared.lighten(40), fg =  Normal.bg, gui = "underline" }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor           { bg = aela.sky.skylblue,           fg =  Normal.bg }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM          { bg = aela.sky.skylblue,           fg =  Normal.bg }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn      { bg = aela.sky.skyblue }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine        { bg = aela.sky.skyblue }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory         { fg = aela.sky.skydeeppink,        gui = "bold" }, -- Directory names (and other special names in listings)
		DiffAdd           { fg = aela.aur.aurgreen,              bg =  Normal.bg }, -- Diff mode: Added line |diff.txt|
		DiffChange        { fg = aela.sky.skylightpeach }, -- Diff mode: Changed line |diff.txt|
		DiffDelete        { fg = aela.sky.skydeeppink }, -- Diff mode: Deleted line |diff.txt|
		-- difftext       { }, -- diff mode: changed text within a changed line |diff.txt|
		endofbuffer       { fg = aela.sky.skydeeppink }, -- filler lines (~) after the end of the buffer. by default, this is highlighted like |hl-nontext|.
		-- termcursor     { }, -- cursor in a focused terminal
		-- termcursornc   { }, -- cursor in an unfocused terminal
		errormsg          { fg = aela.sky.skydeeppink }, -- error messages on the command line
		vertsplit         { fg = aela.sky.skydeeppink }, -- column separating vertically split windows
		folded            { bg = aela.sky.skydlav }, -- line used for closed folds
		foldcolumn        { bg = Normal.bg,                   fg =  aela.aur.aurgreen }, -- 'foldcolumn'
		signcolumn        { bg = Normal.bg,                   fg =  aela.bnw.snow }, -- column where |signs| are displayed
		incsearch         { bg = aela.sky.skylblue,           fg =  Normal.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		substitute        { bg = aela.sky.skyvlightpeach,              fg =  Normal.bg }, -- |:substitute| replacement text highlighting
		linenr            { fg = aela.sky.skyblue }, -- line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- linenrabove    { fg = aela.sea.seaorange }, -- line number for when the 'relativenumber' option is set, above the cursor line
		-- linenrbelow    { fg = aela.sea.lgaqua }, -- line number for when the 'relativenumber' option is set, below the cursor line
		cursorlinenr      { fg = hsl("#07cd56") }, -- like linenr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- cursorlinefold {}, -- like foldcolumn when 'cursorline' is set for the cursor line
		-- cursorlinesign {}, -- like signcolumn when 'cursorline' is set for the cursor line
		matchparen        { bg = hsl("#030a1a"),              fg =  hsl("#ff204d") }, -- character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- modemsg        { }, -- 'showmode' message (e.g., "-- insert -- ")
		-- msgarea        { }, -- area for messages and cmdline
		-- msgseparator   { }, -- separator for scrolled messages, `msgsep` flag of 'display'
		-- moremsg        { }, -- |more-prompt|
		-- nontext        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). see also |hl-endofbuffer|.
		normalfloat       {}, -- normal text in floating windows.
		-- floatborder    { }, -- border of floating windows.
		-- floattitle     { }, -- title of floating windows.
		-- normalnc       { }, -- normal text in non-current windows
		-- pmenu          { }, -- popup menu: normal item.
		-- pmenusel       { }, -- popup menu: selected item.
		-- pmenukind      { }, -- popup menu: normal item "kind"
		-- pmenukindsel   { }, -- popup menu: selected item "kind"
		-- pmenuextra     { }, -- popup menu: normal item "extra text"
		-- pmenuextrasel  { }, -- popup menu: selected item "extra text"
		-- pmenusbar      { }, -- popup menu: scrollbar.
		-- pmenuthumb     { }, -- popup menu: thumb of the scrollbar.
		-- question       { }, -- |hit-enter| prompt and yes/no questions
		-- quickfixline   { }, -- current |quickfix| item in the quickfix window. combined with |hl-cursorline| when the cursor is there.
		-- search            { bg = aela.sky.skylblue,           fg =  Normal.bg }, -- last search pattern highlighting (see 'hlsearch'). also used for similar items that need to stand out.
		-- specialkey     { }, -- unprintable characters: text displayed differently from what it really is. but not 'listchars' whitespace. |hl-whitespace|
		-- spellbad       { }, -- word that is not recognized by the spellchecker. |spell| combined with the highlighting used otherwise.
		-- spellcap       { }, -- word that should start with a capital. |spell| combined with the highlighting used otherwise.
		-- spelllocal     { }, -- word that is recognized by the spellchecker as one that is used in another region. |spell| combined with the highlighting used otherwise.
		-- spellrare      { }, -- word that is recognized by the spellchecker as one that is hardly ever used. |spell| combined with the highlighting used otherwise.
		-- statusline     { }, -- status line of current window
		-- statuslinenc   { }, -- status lines of not-current windows. note: if this is equal to "statusline" vim will use "^^^" in the status line of the current window.
		tabline           { fg = aela.sky.skylblue }, -- tab pages line, not active tab page label
		tablinefill       { fg = aela.sky.skylblue }, -- tab pages line, where there are no labels
		tablinesel        { fg = aela.sky.skydeeppink }, -- tab pages line, active tab page label
		-- title          { }, -- titles for output from ":set all", ":autocmd" etc.
		visual            { bg = hsl("#07CD56"),              fg =  Normal.bg }, -- visual mode selection
		-- visualnos      { }, -- visual mode selection when vim is "not owning the selection".
		-- warningmsg     { }, -- warning messages
		-- whitespace     {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- winseparator   { }, -- separator between window splits. inherts from |hl-vertsplit| by default, which it will replace eventually.
		-- wildmenu       { }, -- current match in 'wildmenu' completion
		-- winbar         { }, -- window bar of current window
		-- winbarnc       { }, -- window bar of not-current windows

		-- common vim syntax groups used for all kinds of code and markup.
		-- commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- see :h group-name
		--
		-- uncomment and edit if you want more specific syntax highlighting.

		-- comment        { }, -- any comment

		constant          { fg = hsl("#fac1a4") }, -- (*) any constant
		-- string         { }, --   a string constant: "this is a string"
		-- character      { }, --   a character constant: 'c', '\n'
		-- number         { }, --   a number constant: 234, 0xff
		-- boolean        { }, --   a boolean constant: true, false
		-- float          { }, --   a floating point constant: 2.3e10

		identifier        { fg = hsl("#f19298") }, -- (*) any variable name
		-- function       { }, --   function name (also: methods for classes)

		statement         { fg = hsl("#128fa3") }, -- (*) any statement
		-- conditional    { }, --   if, then, else, endif, switch, etc.
		-- repeat         { }, --   for, do, while, etc.
		-- label          { }, --   case, default, etc.
		-- operator       { }, --   "sizeof", "+", "*", etc.
		-- keyword        { }, --   any other keyword
		-- exception      { }, --   try, catch, throw

		-- preproc        { }, -- (*) generic preprocessor
		-- include        { }, --   preprocessor #include
		-- define         { }, --   preprocessor #define
		-- macro          { }, --   same as define
		-- precondit      { }, --   preprocessor #if, #else, #endif, etc.

		-- type           { }, -- (*) int, long, char, etc.
		-- storageclass   { }, --   static, register, volatile, etc.
		-- structure      { }, --   struct, union, enum, etc.
		-- typedef        { }, --   a typedef

		-- special        { }, -- (*) any special symbol
		-- specialchar    { }, --   special character in a constant
		-- tag            { }, --   you can use ctrl-] on this
		-- delimiter      { }, --   character that needs attention
		-- specialcomment { }, --   special things inside a comment (e.g. '\n')
		-- debug          { }, --   debugging statements

		-- underlined     { gui = "underline" }, -- text that stands out, html links
		-- ignore         { }, -- left blank, hidden |hl-ignore| (note: may be invisible here in template)
		-- error          { }, -- any erroneous construct
		-- todo           { }, -- anything that needs extra attention; mostly the keywords todo fixme and xxx

		-- these groups are for the native lsp client and diagnostic system. some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
