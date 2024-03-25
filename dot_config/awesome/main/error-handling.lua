-- Notification library
local naughty	= require("naughty")
local awful 	= require("awful")
local my_table	=	awful.util.table or gears.table

-- Check if awesome encountered an error during startup and fell back
-- to another config (this code only executes for fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset	= naughty.config.presets.critical,
		title	= "ERRORS",
		text	= awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- make sure we don't get stuck in an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({
			preset	= naughty.config.presets.critical,
			title	= "Runtime error!",
			text	= tostring(err)
		})
		in_error = false
	end)
end
