---@diagnostic disable: unused-local, undefined-global, lowercase-global
-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local revelation	  = require("revelation")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
-- local audio_widget  = require("awesome-pulseaudio-widget")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
-- local conky			= require("conky")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local markup 		    = lain.util.markup

-- }}}

-- Custom Local Library: Common Functional Decoration
theme		= require("themes." .. RC.themename .. ".theme")
colsch		= require("themes." .. RC.colsch)
deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}
local _M = {}

WB = {}
W  = {}
I  = {}

require("statusbar." .. RC.statusbar .. ".wibox_helpers")

WB.tag_buttons		= deco.taglist()
WB.task_buttons		= deco.tasklist()

wibox_package = WB

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- MAIN{{{
function _M.init()

	awful.screen.connect_for_each_screen(function(s)
		WB.make_base_widgets (s)
		WB.make_top_wibox (s)
		WB.make_bottom_wibox (s)
		-- beautiful.get().at_screen_connect(s)
  end)

end--}}}


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.init(...) end })
