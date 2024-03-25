-- Standard
local awful 		= require("awful")
local beautiful 	= require("beautiful")
local my_table		= awful.util.table or gears.table
local theme			= require("themes." .. RC.themename .. ".theme")

local _M = {}

function _M.get ()
	local tags = {}

	RC.taglaypairs = {

		names  = { "", "", "", "", "", "", "", "", "" },

		layout = { RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[1] }

	}

	awful.screen.connect_for_each_screen(function(s)
		tags[s] = awful.tag(RC.taglaypairs.names, s, RC.taglaypairs.layout)
	end)

	return tags
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
