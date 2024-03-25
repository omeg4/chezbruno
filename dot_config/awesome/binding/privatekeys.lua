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

-- local modkey = RC.vars.modkey
-- local altkey = RC.vars.altkey
-- local terminal = RC.vars.terminal

local modkey = RC.vars.modkey
local altkey = RC.vars.altkey
local terminal = RC.vars.terminal

privatekeys = my_table.join(

	--
	-- Replace Lua prompt with secret QuTebrowser
	awful.key({ modkey 			}, "x", function () awful.spawn("qutebrowser ':open -p' ':q'") end,
			{description = "Open private QuTebrowser", group = "launcher"}),

	-- ?
	awful.key({ modkey, "Shift"	}, "x", function () awful.spawn("zsh /home/bruno/Documents/.allmystuff/wm-scripts/psfour.sh", { below = true}) end,
			{description = "run myscript", group = "launcher"}),

	-- ??
	awful.key({ modkey       	}, "v", function () awful.spawn("zsh /home/bruno/Documents/.allmystuff/wm-scripts/myvertscript.sh", { below = true }) end,
			{description = "run myvertscript", group = "launcher"}),

	-- ??
	awful.key({ modkey, "Shift"	}, "v", function () awful.spawn("zsh /home/bruno/Documents/.allmystuff/wm-scripts/psnine", { below = true }) end,
			{description = "run myotherscript", group = "launcher"})

)

return privatekeys
