-- Standard
local gears = require("gears")
local awful = require("awful")

local _M = {}
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

function _M.get()
	local globalbuttons = my_table.join(
		-- awful.button({ }, 3, function () RC.mainmenu:toggle() end)
		awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end)
	-- ,	awful.button({ }, 4, awful.tag.viewnext)
	-- ,	awful.button({ }, 5, awful.tag.viewprev)
	)

	return globalbuttons
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
