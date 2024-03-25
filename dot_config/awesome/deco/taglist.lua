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
local revelation	= require("revelation")
--local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
-- local conky			= require("conky")
-- local cpu_widget	= require("awesome-wm-widgets.cpu-widget.cpu-widget")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
-- }}}

local _M = {}

function _M.get()
	local taglist_buttons = my_table.join(
		awful.button({ }, 1, function(t) t:view_only() end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({ }, 9, function(t) awful.tag.viewnext(t.screen) end),
		awful.button({ }, 8, function(t) awful.tag.viewprev(t.screen) end)
	)
	return taglist_buttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable( {}, {
	__call = function(_, ...) return _M.get(...) end
} )
