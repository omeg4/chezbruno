-- Standard libraries, etc. etc.
local gears = require("gears")
local awful = require("awful")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

local _M = {}
local modkey = RC.vars.modkey

-- So I should take a little bit of extra care here to make sure I'm splitting stuff up properly
-- This file binds the tags to Mod+#, etc.
-- The names of the tags themselves are defined in ../main/tags.lua

function _M.get(globalkeys)
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
		globalkeys = my_table.join(globalkeys,

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
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
