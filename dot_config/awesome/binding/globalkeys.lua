-- Standard
local gears 	= require("gears")
local awful 	= require("awful")
local lain		= require("lain")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("main.theme")

local hotkeys_popup = 	require("awful.hotkeys_popup").widget
						require("awful.hotkeys_popup.keys")
local my_table		=	awful.util.table or gears.table

local modkey = RC.vars.modkey
local altkey = RC.vars.altkey
local terminal = RC.vars.terminal
local term_alt = RC.vars.term_alt

local _M = {}

function _M.get()
	local privatekeys = require("binding.privatekeys")

	local globalkeys = my_table.join(
		privatekeys,

		-- My revelation bindings{{{
		-- awful.key({ modkey }, "e", revelation),--}}}

		-- Take a screenshot{{{
		-- https://github.com/lcpz/dots/blob/master/bin/screenshot
		-- awful.key({ altkey }, "p", function() os.execute("scrot '%Y-%m-%d_%T_scrot.png' -e 'optipng $f && mv -b -t ~/Pictures/screenshots $f'") end,
		--           {description = "take a screenshot", group = "hotkeys"}),--}}}

		-- Take a screenshot of a selected area{{{
		-- https://github.com/lcpz/dots/blob/master/bin/screenshot
		-- awful.key({ altkey, "Shift" }, "p", function() os.execute("scrot -fbs '%Y-%m-%d_%T_clip.png' -e 'optipng $f && mv -b -t ~/Pictures/screenshots $f'") end,
		--           {description = "take a screenshot", group = "hotkeys"}),--}}}

		-- X screen locker{{{
		-- awful.key({ altkey, "Control" }, "l", function () os.execute(scrlocker) end,
		--           {description = "lock screen", group = "hotkeys"}),--}}}

		-- Windows-like screencaps{{{
		-- 07/20/23 Fixed desktop freeze on screenshot. Thanks reddit!
		-- https://www.reddit.com/r/awesomewm/comments/tcc4pk/looking_for_some_help_with_flameshot/
		awful.key({ modkey, "Shift" }, "s", function() awful.spawn("flameshot gui") end,
					{description = "flameshot screenshot", group = "hotkeys"}),--}}}

		-- Show hotkey widget{{{
		awful.key({ modkey }, "s",      hotkeys_popup.show_help,
				  {description = "show help", group="awesome"}),--}}}

		-- Show hotkey widget (optional args) {{{
		awful.key({ modkey, altkey }, "s",      hotkeys_popup.show_help,
				  {description = "show help (optional args)", group="awesome", show_awesome_keys="false"}),--}}}

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
					s.wibox_top.visible = not s.wibox_top.visible
					if s.wibox_bottom then
						s.wibox_bottom.visible = not s.wibox_bottom.visible
					end
				end
			end,
			{description = "toggle wibox", group = "awesome"}),--}}}

		-- Show/Hide CONKY Wibox{{{
		-- awful.key({ modkey, "Shift" }, "b", function ()
		-- 		for s in screen do
		-- 			s.myconkywibox.visible = not s.myconkywibox.visible
		-- 		end
		-- 	end,
		-- 	{description = "toggle conky wibox", group = "awesome"}),--}}}

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
		awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
				  {description = "open a terminal", group = "launcher"}),
		awful.key({ modkey, "Shift"	  }, "Return", function () awful.spawn(term_alt) end,
				  {description = "open a terminal", group = "launcher"}),
		awful.key({ modkey, "Control" }, "r", awesome.restart,
				  {description = "reload awesome", group = "awesome"}),
	--    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
	--              {description = "quit awesome", group = "awesome"}),}}}

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

		-- Copy primary to clipboard (terminals to gtk){{{
		-- awful.key({ modkey }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
		--           {description = "copy terminal to gtk", group = "hotkeys"}),
		-- Copy clipboard to primary (gtk to terminals)
		-- awful.key({ modkey }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
		--           {description = "copy gtk to terminal", group = "hotkeys"}),}}}

		-- User programs{{{

		-- Cheatsheet dmenu
		-- awful.key({ modkey,  "Shift"  }, "s", function() awful.spawn(
		--                 "zsh /home/matt/cheatsheetpicker.sh", {
		--                     floating 	= true,
		--                     tag			= mouse.screen.selected_tag,
		--                     placement 	= awful.placement.top_left,
		--                 }
		--             ) end,
		--           {description = "pick-a-cheatsheet", group = "launcher"}),

			-- This is supposed to be an interactive tmux session chooser, but I'm having trouble escaping the quotation marks
		-- awful.key({ modkey,        	}, "'", function () awful.spawn("xfce4-terminal -x tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t") end,
		--           {description = "Open a new TMUX session", group = "launcher"}),
		awful.key({ modkey 			}, "q", function () awful.spawn(RC.vars.browser) end,
				  {description = "run browser", group = "launcher"}),
		awful.key({ modkey, "Shift" }, "q", function () awful.spawn("qutebrowser") end,
				  {description = "open QuTebrowser", group = "launcher"}),
		awful.key({ modkey 			}, "a", function () awful.spawn("alacritty -e byobu-tmux new-session -A -s 'nvim' nvim") end,
				  {description = "run gui editor", group = "launcher"}),
		awful.key({ modkey 			}, "d", function () awful.spawn("rofi -show combi") end,
				  {description = "rofi combi", group = "launcher"}),

		-- Replace run prompt with ranger startup
		awful.key({ modkey 			}, "r", function () awful.spawn("kitty ranger") end,
				{description = "Spawn new Kitty window and open ranger", group = "launcher"}),

		-- Force new ranger session with M+S+r
		awful.key({ modkey, "Shift" }, "r", function () awful.spawn("kitty $(cd /mnt/sgext/stuff && ranger)") end,
				{description = "WIP - open session named 'rng' if not exists else spawn w/ new name", group = "launcher"}),

		-- Apparently "g" is unbound so use it to spawn glances
		awful.key({ modkey 			}, "g", function () awful.spawn("alacritty -e byobu-tmux new-session -A -s 'glnc' 'glances -t 0.5 -1 -6 --diskio-iops'") end,
				{description = "Open Glances", group = "hotkeys"}),

		-- Open Vimwiki
		awful.key({ modkey 			}, "w", function () awful.spawn("alacritty -e byobu-tmux new-session -A -s 'vwiki' nvim +:VimwikiIndex +:VimwikiDiaryIndex +':h Vimwiki' +':wincmd L' +':wincmd ='") end,
				{description = "open vimwiki index/diary", group = "launcher"})
		-- awful.key({ modkey 			}, "w", function () awful.spawn("xfce4-terminal -T VimWiki -e 'nvim +:VimwikiIndex'") end,
		--         {description = "open vimwiki", group = "launcher"}),
		-- awful.key({ modkey, "Shift" }, "w", function () awful.spawn("xfce4-terminal -T VimWikiDiary -e 'nvim +:VimwikiDiaryIndex'") end,
		--         {description = "open vimwiki diary", group = "launcher"}),}}}

	)
	return globalkeys
end

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

 return setmetatable( {}, {
	 __call = function(_, ...) return _M.get(...) end
 })
