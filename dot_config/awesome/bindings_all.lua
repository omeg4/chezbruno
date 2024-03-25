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
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

RC = {} -- instantiate a global user namespace

RC.vars = {
	modkey       = "Mod4",
	altkey       = "Mod1",
	terminal     = "alacritty",
	editor       = "nvim",
	gui_editor   = "nvim",
	browser      = "vivaldi-snapshot",
	guieditor    = "nvim",
	scrlocker    = "slock",
	wallpaper 	 = nil
}

RC.themename	= "seasky"
RC.colsch		= "aela"
RC.statusbar	= "frankie"

modkey = RC.vars.modkey -- in main/user-variables.lua there's a line that just says modkey = "Mod4" :: OK it's a bit more complicated than that but w/e
altkey = RC.vars.altkey

-- ALL BINDING STUFF{{{
globalbuttons	= function ()--{{{
	return my_table.join(
		awful.button({ }, 3, function () RC.mainmenu:toggle() end),
		awful.button({ }, 4, awful.tag.viewnext),
		awful.button({ }, 5, awful.tag.viewprev)
	)
end--}}}

clientbuttons	= function ()--{{{
	return my_table.join(
		awful.button({ }, 1, function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
		end),
		awful.button({ modkey }, 1, function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.move(c)
		end),
		awful.button({ modkey }, 3, function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.resize(c)
		end)
	)
end--}}}

globalkeys		= function ()--{{{
	return my_table.join(
		require("binding.privatekeys"),

		-- My revelation bindings{{{
		awful.key({ modkey }, "e", revelation),--}}}

		-- Take a screenshot{{{
		-- https://github.com/lcpz/dots/blob/master/bin/screenshot
		awful.key({ altkey }, "p", function() os.execute("scrot '%Y-%m-%d_%T_scrot.png' -e 'mv $f ~/Pictures/screenshots/'") end,
				  {description = "take a screenshot", group = "hotkeys"}),--}}}

		-- X screen locker{{{
		-- awful.key({ altkey, "Control" }, "l", function () os.execute(scrlocker) end,
		--           {description = "lock screen", group = "hotkeys"}),}}}

		-- Show hotkey widget{{{
		awful.key({ modkey }, "s",      hotkeys_popup.show_help,
				  {description = "show help", group="awesome"}),--}}}

		-- Tag browsing{{{
		awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
				  {description = "view previous", group = "tag"}),
		awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
				  {description = "view next", group = "tag"}),
		awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
				  {description = "go back", group = "tag"}),

		-- Non-empty tag browsing
		awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
				  {description = "view  previous nonempty", group = "tag"}),
		awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
				  {description = "view  previous nonempty", group = "tag"}),

		-- Default client focus
		awful.key({ altkey,           }, "j",
			function ()
				awful.client.focus.byidx( 1)
			end,
			{description = "focus next by index", group = "client"}
		),
		awful.key({ altkey,           }, "k",
			function ()
				awful.client.focus.byidx(-1)
			end,
			{description = "focus previous by index", group = "client"}
		),--}}}

		-- By direction client focus{{{
		awful.key({ modkey }, "j",
			function()
				awful.client.focus.global_bydirection("down")
				if client.focus then client.focus:raise() end
			end,
			{description = "focus down", group = "client"}),
		awful.key({ modkey }, "k",
			function()
				awful.client.focus.global_bydirection("up")
				if client.focus then client.focus:raise() end
			end,
			{description = "focus up", group = "client"}),
		awful.key({ modkey }, "h",
			function()
				awful.client.focus.global_bydirection("left")
				if client.focus then client.focus:raise() end
			end,
			{description = "focus left", group = "client"}),
		awful.key({ modkey }, "l",
			function()
				awful.client.focus.global_bydirection("right")
				if client.focus then client.focus:raise() end
			end,
			{description = "focus right", group = "client"}),
		-- awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
		--           {description = "show main menu", group = "awesome"}),
--}}}

		-- Layout manipulation{{{
		awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
				  {description = "swap with next client by index", group = "client"}),
		awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
				  {description = "swap with previous client by index", group = "client"}),
		awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
				  {description = "focus the next screen", group = "screen"}),
		awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
				  {description = "focus the previous screen", group = "screen"}),
		awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
				  {description = "jump to urgent client", group = "client"}),
		awful.key({ modkey,           }, "Tab",
			function ()
				awful.client.focus.history.previous()
				if client.focus then
					client.focus:raise()
				end
			end,
			{description = "go back", group = "client"}),
--}}}

		-- Show/Hide Wibox{{{
		awful.key({ modkey }, "b", function ()
				for s in screen do
					s.mywibox.visible = not s.mywibox.visible
					if s.mybottomwibox then
						s.mybottomwibox.visible = not s.mybottomwibox.visible
					end
				end
			end,
			{description = "toggle wibox", group = "awesome"}),--}}}

		-- Show/Hide CONKY Wibox{{{
		awful.key({ modkey, "Shift" }, "b", function ()
				for s in screen do
					s.myconkywibox.visible = not s.myconkywibox.visible
				end
			end,
			{description = "toggle conky wibox", group = "awesome"}),--}}}

		-- On the fly useless gaps change{{{
		awful.key({ altkey, "Control", "Shift" }, "=", function () lain.util.useless_gaps_resize(12) end,
				  {description = "increment useless gaps", group = "tag"}),
		awful.key({ altkey, "Control" }, "=", function () lain.util.useless_gaps_resize( 1) end,
				  {description = "increment useless gaps", group = "tag"}),
		awful.key({ altkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end,
				  {description = "increment useless gaps", group = "tag"}),
		awful.key({ altkey, "Control" }, "0", function () lain.util.useless_gaps_resize(-14) end,
				  {description = "decrement useless gaps", group = "tag"}),--}}}

		-- Dynamic tagging{{{
		awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end,
				  {description = "add new tag", group = "tag"}),
		awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end,
				  {description = "rename tag", group = "tag"}),
		awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(-1) end,
				  {description = "move tag to the left", group = "tag"}),
		awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(1) end,
				  {description = "move tag to the right", group = "tag"}),
		awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end,
				  {description = "delete tag", group = "tag"}),--}}}

		-- Standard program{{{
		awful.key({ modkey,           }, "Return", function () awful.spawn("alacritty") end,
				  {description = "open a terminal", group = "launcher"}),
		awful.key({ modkey, "Control" }, "r", awesome.restart,
				  {description = "reload awesome", group = "awesome"}),--}}}

		-- Client resizing, changing layouts, restoring minimized clients{{{
		awful.key({ altkey, "Shift"   }, "l",     function () awful.tag.incmwfact( 0.05)          end,
				  {description = "increase master width factor", group = "layout"}),
		awful.key({ altkey, "Shift"   }, "h",     function () awful.tag.incmwfact(-0.05)          end,
				  {description = "decrease master width factor", group = "layout"}),
		awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
				  {description = "increase the number of master clients", group = "layout"}),
		awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
				  {description = "decrease the number of master clients", group = "layout"}),
		awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
				  {description = "increase the number of columns", group = "layout"}),
		awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
				  {description = "decrease the number of columns", group = "layout"}),
		awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
				  {description = "select next", group = "layout"}),
		awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
				  {description = "select previous", group = "layout"}),

		awful.key({ modkey, "Control" }, "n",
				  function ()
					  local c = awful.client.restore()
					  -- Focus restored client
					  if c then
						  client.focus = c
						  c:raise()
					  end
				  end,
				  {description = "restore minimized", group = "client"}),--}}}

		-- Dropdown application{{{
		awful.key({ modkey, }, "z", function () awful.screen.focused().quake:toggle() end,
				  {description = "dropdown application", group = "launcher"}),--}}}

		-- Widgets popups{{{
		awful.key({ modkey, altkey, }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
				  {description = "show calendar", group = "widgets"}),
		awful.key({ modkey, altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
				  {description = "show filesystem", group = "widgets"}),
		awful.key({ modkey, altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
				  {description = "show weather", group = "widgets"}),--}}}

		-- Brightness{{{
		awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
				  {description = "+10%", group = "hotkeys"}),
		awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
				  {description = "-10%", group = "hotkeys"}),--}}}

		-- ALSA volume control ***MY KEYBINDINGS*** {{{
		awful.key({ }, "XF86AudioRaiseVolume",
			function ()
				os.execute(string.format("amixer -q set %s 2%%+", W.volume.channel))
				W.volume.update()
			end,
			{description = "my volume up", group = "hotkeys"}),

		awful.key({ }, "XF86AudioLowerVolume",
			function ()
				os.execute(string.format("amixer -q set %s 2%%-", W.volume.channel))
				W.volume.update()
			end,
			{description = "my volume down", group = "hotkeys"}),

		awful.key({ altkey }, "XF86AudioLowerVolume",
			function ()
				os.execute(string.format("amixer -q set %s toggle", W.volume.togglechannel or W.volume.channel))
				W.volume.update()
			end,
			{description = "my toggle mute", group = "hotkeys"}),

		awful.key({ altkey }, "XF86AudioRaiseVolume",
			function ()
				os.execute(string.format("amixer -q set %s 100%%", W.volume.channel))
				W.volume.update()
			end,
			{description = "my volume 100%", group = "hotkeys"}),

		awful.key({ altkey }, "End",
			function ()
				os.execute(string.format("amixer -q set %s 0%%", W.volume.channel))
				W.volume.update()
			end,
			{description = "volume 0%", group = "hotkeys"}),
		-- }}}

		-- MPD control{{{
		awful.key({ altkey, "Control" }, "Up",
			function ()
				os.execute("playerctl play-pause")
				beautiful.mpd.update()
			end,
			{description = "playerctl toggle", group = "widgets"}),
		awful.key({ altkey, "Control" }, "Down",
			function ()
				os.execute("playerctl stop")
				beautiful.mpd.update()
			end,
			{description = "playerctl STOP", group = "widgets"}),
		awful.key({ altkey, "Control" }, "Left",
			function ()
				os.execute("playerctl previous")
				beautiful.mpd.update()
			end,
			{description = "playerctl previous", group = "widgets"}),
		awful.key({ altkey, "Control" }, "Right",
			function ()
				os.execute("playerctl next")
				beautiful.mpd.update()
			end,
			{description = "playerctl next", group = "widgets"}),
		awful.key({ altkey }, "0",
			function ()
				local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
				if beautiful.mpd.timer.started then
					beautiful.mpd.timer:stop()
					common.text = common.text .. lain.util.markup.bold("OFF")
				else
					beautiful.mpd.timer:start()
					common.text = common.text .. lain.util.markup.bold("ON")
				end
				naughty.notify(common)
			end,
			{description = "mpc on/off", group = "widgets"}),--}}}


		-- User programs{{{

		-- Cheatsheet dmenu
		awful.key({ modkey,  "Shift"  }, "s", function() awful.spawn(
						"zsh /home/bruno/cheatsheetpicker.sh", {
							floating 	= true,
							tag			= mouse.screen.selected_tag,
							placement 	= awful.placement.top_left,
						}
					) end,
				  {description = "pick-a-cheatsheet", group = "launcher"}),

		awful.key({ modkey, "Shift"	}, "Return", function () awful.spawn("alacritty -e tmux -2") end,
				  {description = "Open a new TMUX session", group = "launcher"}),

		awful.key({ modkey 			}, "q", function () awful.spawn("vivaldi-snapshot") end,
				  {description = "run browser", group = "launcher"}),

		awful.key({ modkey, "Shift" }, "q", function () awful.spawn("qutebrowser") end,
				  {description = "open QuTebrowser", group = "launcher"}),

		awful.key({ modkey 			}, "a", function () awful.spawn("alacritty -t nvim_AWMS -e nvim") end,
				  {description = "run gui editor", group = "launcher"}),

		awful.key({ modkey 			}, "d", function () awful.spawn("rofi -show combi") end,
				  {description = "rofi combi", group = "launcher"}),

		-- Replace run prompt with ranger startup
		awful.key({ modkey 			}, "r", function () awful.spawn("alacritty -t ranger_AWMS -e ranger") end,
				{description = "open ranger", group = "launcher"}),

		-- Apparently "g" is unbound so use it to spawn glances
		awful.key({ modkey 			}, "g", function () awful.spawn("alacritty -t glances -e glances -t 0.5 -1 -6 --diskio-iops") end,
				{description = "Open Glances", group = "hotkeys"}),

		-- Open Vimwiki
		awful.key({ modkey 			}, "w", function () awful.spawn("alacritty -t VimWiki -e nvim +:VimwikiIndex +:VimwikiDiaryIndex +':h Vimwiki' +':wincmd L' +':wincmd ='") end,
				{description = "open vimwiki index/diary", group = "launcher"})
		-- }}}

	)
end--}}}

bindtotags		= function (globalkeys)--{{{
	-- Bind all key numbers to tags
	for i = 1, 9 do
		-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
		local descr_view, descr_toggle, descr_move, descr_toggle_focus
		if i == 1 or i == 9 then
			descr_view = {description = "view tag #", group = "tag"}
			descr_toggle = {description = "toggle tag #", group = "tag"}
			descr_move = {description = "move focused client to tag #", group = "tag"}
			descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
		end
		globalkeys = my_table.join(

			globalkeys,

			-- View tag only.
			awful.key({ modkey }, "#" .. i + 9,
					  function ()
							local screen = awful.screen.focused()
							local tag = screen.tags[i]
							if tag then
							   tag:view_only()
							end
						end,
					  descr_view),

			-- Toggle tag display.
			awful.key({ modkey, "Control" }, "#" .. i + 9,
					  function ()
						  local screen = awful.screen.focused()
						  local tag = screen.tags[i]
						  if tag then
							 awful.tag.viewtoggle(tag)
						  end
					  end,
					  descr_toggle),

			-- Move client to tag.
			awful.key({ modkey, "Shift" }, "#" .. i + 9,
					  function ()
						  if client.focus then
							  local tag = client.focus.screen.tags[i]
							  if tag then
								  client.focus:move_to_tag(tag)
							  end
						 end
					  end,
					  descr_move),

			-- Toggle tag on focused client.
			awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
					  function ()
						  if client.focus then
							  local tag = client.focus.screen.tags[i]
							  if tag then
								  client.focus:toggle_tag(tag)
							  end
						  end
					  end,
					  descr_toggle_focus)
		)
	end
	return globalkeys
end--}}}

clientkeys		= function ()--{{{
	return my_table.join(

		awful.key({ altkey, 		  }, "m",      lain.util.magnify_client,
				  {description = "magnify client", group = "client"}),

		awful.key({ modkey,           }, "f",
			function (c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			{description = "toggle fullscreen", group = "client"}),

		awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
				  {description = "close", group = "client"}),

		awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
				  {description = "toggle floating", group = "client"}),

		awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
				  {description = "move to master", group = "client"}),

		awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
				  {description = "move to screen", group = "client"}),
				  --
		-- Changed this binding
		awful.key({ modkey, "Control" }, "t",      function (c) c.ontop = not c.ontop            end,
				  {description = "toggle keep on top", group = "client"}),

		awful.key({ modkey,           }, "n",
			function (c)
				-- The client currently has the input focus, so it cannot be
				-- minimized, since minimized clients can't have the focus.
				c.minimized = true
			end ,
			{description = "minimize", group = "client"}),

		awful.key({ modkey,           }, "m",
			function (c)
				c.maximized = not c.maximized
				c:raise()
			end ,
			{description = "maximize", group = "client"}),

		awful.key({ modkey, "Control" }, "m",
			  function (c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			  end ,
			  {description = "(un)maximize vertically", group = "client"}),

		awful.key({ modkey, "Shift"   }, "m",
			  function (c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			  end ,
			  {description = "(un)maximize horizontally", group = "client"})
	)
end--}}}

root.buttons(globalbuttons)
root.keys(globalkeys)

rulesfunc = function (clientkeys, clientbuttons)--{{{
	local rules = {

		-- conky.rules(),

		-- All clients will follow these rules (unless overridden below)
		{ rule = { },
			 properties = {
				border_width 	= beautiful.border_width,
				border_color 	= beautiful.border_normal,
				focus 			= awful.client.focus.filter,
				raise 			= true,
				keys 			= clientkeys,
				buttons 		= clientbuttons,
				screen 			= awful.screen.preferred,
				placement 		= awful.placement.no_overlap+awful.placement.no_offscreen,
				-- size_hints_honor = false
			 }
		},

		-- No titlebars on clients
		{
			rule_any 	= {
				type = { "dialog", "normal" }
			},
			properties 	= { titlebars_enabled = false }
		},

		-- Program-specific rules
		{ rule = { class = "Gimp", role = "gimp-image-window" },
			  properties = { maximized = true } },

		{ rule = { class = "mpv" },
			  properties = { ontop = true } },

		{ rule = { class = "Godot" },
			  properties = { ontop = true, floating = true } }
	}

	return rules
end--}}}

-- Huh, so "global" bindings (keyboard & mouse) are set with `root.`
-- Meanwhile client bindings are set with `awful.rules`
awful.rules.rules = rulesfunc( -- Formerly in main.rules
	clientkeys(),
	clientbuttons()
)--}}}

-- LAYOUTS{{{
awful.layout.layouts = {
		-- awful.layout.suit.floating,
		awful.layout.suit.tile,
		-- awful.layout.suit.tile.left,
		-- awful.layout.suit.tile.bottom,
		-- awful.layout.suit.tile.top,
		awful.layout.suit.fair,
		-- awful.layout.suit.fair.horizontal,
		awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		-- awful.layout.suit.max,
		-- awful.layout.suit.max.fullscreen,
		-- awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
		-- awful.layout.suit.corner.ne,
		-- awful.layout.suit.corner.sw,
		-- awful.layout.suit.corner.se,
		-- lain.layout.cascade,
		-- lain.layout.cascade.tile,
		lain.layout.centerwork
		-- lain.layout.centerwork.horizontal,
		-- lain.layout.termfair,
		-- lain.layout.termfair.center,
	}
--}}}


