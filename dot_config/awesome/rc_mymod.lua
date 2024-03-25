-- Load standard(-ish) libraries{{{
pcall(require, "luarocks.loader")

local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local revelation	= require("revelation")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
-- local conky			= require("conky")
-- local cpu_widget	= require("awesome-wm-widgets.cpu-widget.cpu-widget")
-- local radical 		= require("radical")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

Remote = awful.remote
--}}}

RC = {} -- instantiate a global user namespace
RC.vars = require("main.user-variables") -- in the modular config, there exists a file called ./main/user-variables.lua so this 'sources' that file

RC.themename	= "seasky"
RC.colsch		= "aela"
RC.statusbar	= "frankie"

-- Error handling
require("main.error-handling") 	-- ./main/error-handling.lua

-- Load the theme
require("main.theme") 			-- ./main/theme.lua

-- local bling 		= require("bling")

modkey = RC.vars.modkey 		-- ./main/user-variables.lua - there's a line that just says modkey = "Mod4" :: OK it's a bit more complicated than that but w/e
altkey = RC.vars.altkey

-- Custom local library
local main = {
	layouts = require("main.layouts"), 	-- ./main/layouts.lua
	tags	  = require("main.tags"), 	-- ./main/tags.lua
	menu	  = require("main.menu"), 	-- ./main/menu.lua
	rules	  = require("main.rules") 	-- ./main/rules.lua
}

-- Custom local library: key/mouse bindings
local binding = {
	globalbuttons	= require("binding.globalbuttons"), 	-- ./binding/globalbuttons.lua
	clientbuttons	= require("binding.clientbuttons"), 	-- ./binding/clientbuttons.lua
	globalkeys		= require("binding.globalkeys"),    	-- ./binding/globalkeys.lua
	bindtotags		= require("binding.bindtotags"),    	-- ./binding/bindtotags.lua
	clientkeys		= require("binding.clientkeys")     	-- ./binding/clientkeys.lua
}

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc (order matters)
RC.layouts = main.layouts()
awful.layout.layouts = RC.layouts
-- }}}

-- {{{ Tags
-- Define a tag table to hold all screen tags
RC.tags = main.tags()
awful.util.tagnames = RC.taglaypairs.names
-- }}}

-- {{{ Menu (OLD)
-- Create a launcher widget and main menu
-- RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys

-- variable needed for statusbar
-- RC.launcher = awful.widget.launcher({
--     image 	= beautiful.awesome_icon,
--     menu	= RC.mainmenu
-- })

-- Menubar config (set terminal)
-- menubar.utils.terminal = RC.vars.terminal

-- }}}

-- {{{ Key/mouse bindings
RC.globalkeys	= binding.globalkeys()
RC.globalkeys	= binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
-- }}}

-- Keyboard map indicator and switcher
RC.mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules( -- Should it be ({ binding, ... }) or no?
	binding.clientkeys(),
	binding.clientbuttons()
)
-- }}}

-- {{{ Signals
require("main.signals") 	-- ./main/signals.lua
-- }}}

-- {{{ Statusbar: Wibar
-- RC.statusbar == "statusbar.frankie"
local statusbar = require("statusbar." .. RC.statusbar .. ".statusbar")
statusbar()
-- }}}

-- {{{ Autostart
awful.spawn.with_shell("~/.config/awesome/autostart.sh")
awful.spawn.with_shell("picom -b --config $HOME/.config/awesome/picom.conf")
-- }}}
