-- Required standard libraries
local awful		= require("awful")
local beautiful	= require("beautiful")
local wibox		= require("wibox")
local lain		= require("lain")

-- Custom libraries
local my_table	= awful.util.table or gears.table
local markup	= require("lain.util.markup")

require("statusbar." .. RC.statusbar .. ".widgets")

-- Define some common/helpful variables/shortcuts{{{
WB.spacer		= wibox.widget.textbox(" ")
WB.spacerline	= wibox.widget.textbox(" | ")

separators	= lain.util.separators
arrow_color			= colsch.color['seared']
WB.arrow_dl			= separators.arrow_left("alpha",	arrow_color)
WB.arrow_ld			= separators.arrow_left(arrow_color,	"alpha")
WB.arrow_dr			= separators.arrow_right("alpha",	arrow_color)
WB.arrow_rd			= separators.arrow_right(arrow_color,	"alpha")
--}}}

-- WB.make_base_widgets (s){{{
-- Function which takes screen number as an argument and makes
-- STOCK widgets
-- e.g. prompt/layout box, tag/task list
function WB.make_base_widgets (s)
	set_wallpaper(s)
	-- Create promptbox widget
	s.mypromptbox	= awful.widget.prompt()
	-- Create layoutbox widget
	s.mylayoutbox	= awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({ }, 1, function () awful.layout.inc( 1) end),
		awful.button({ }, 3, function () awful.layout.inc(-1) end),
		awful.button({ }, 4, function () awful.layout.inc( 1) end),
		awful.button({ }, 5, function () awful.layout.inc(-1) end)
	))
    -- Create a taglist widget
	s.mytaglist 	= awful.widget.taglist{
		screen  	= s,
		filter  	= awful.widget.taglist.filter.all,
		buttons 	= WB.tag_buttons
	}
	-- Make the taglist the old way
	s.mytaglist2	= awful.widget.taglist(s, awful.widget.taglist.filter.all, WB.tag_buttons)

    -- Create a tasklist widget
    s.mytasklist 	= awful.widget.tasklist{
		screen 		= s,
		filter 		= awful.widget.tasklist.filter.currenttags,
		buttons 	= WB.task_buttons
	}
	-- Make the tasklist the old way
	s.mytasklist2	= awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, WB.task_buttons)
end
--}}}

-- TOP WIBOX{{{

-- LEFT WIDGETS{{{
function WB.top_left_widgets (s)
	return { -- Top Left Widgets
		layout = wibox.layout.fixed.horizontal,
		RC.launcher,
		WB.spacer,
		s.mytaglist
}
end
--}}}

-- MIDDLE WIDGETS{{{
function WB.top_middle_widgets (s)
	return nil
end
--}}}

-- RIGHT WIDGETS{{{
function WB.top_right_widgets (s)
	return { -- Top Right Widgets
		layout = wibox.layout.fixed.horizontal,
		I.netdownicon, 	W.netdowninfo,
		I.netupicon,	W.netupinfo.widget,
		I.volicon,		W.volume.widget,
		I.memicon,		W.memory.widget,
		I.cpuicon,		W.cpu.widget,
		I.tempicon,		W.temp.widget,
		I.weathericon,	W.weather.widget,
		W.mytextclock,
		wibox.widget.systray()
}
end
--}}}

-- MAKE THE TOP WIBOX{{{
function WB.make_top_wibox (s)
	s.wibox_top	= awful.wibar({
		position		= "top",
		screen			= s,
		border_width	= 0,
		height			= 20,
		bg				= theme.bg_normal,
		fg				= theme.fg_normal
	})

	s.wibox_top:setup {
		layout = wibox.layout.align.horizontal,
		WB.top_left_widgets (s),
		WB.top_middle_widgets (s),
		WB.top_right_widgets (s)
	}
end
--}}}
--}}}

-- BOTTOM WIBOX{{{

-- LEFT WIDGETS{{{
function WB.bottom_left_widgets (s)
	return { -- Bottom Left Widgets
		layout = wibox.layout.fixed.horizontal
}
end
--}}}

-- MIDDLE WIDGETS{{{
function WB.bottom_middle_widgets (s)
	return s.mytasklist
end
--}}}

-- RIGHT WIDGETS{{{
function WB.bottom_right_widgets (s)
	return {
		layout = wibox.layout.fixed.horizontal,
		s.mylayoutbox
}
end
--}}}

-- MAKE THE BOTTOM WIBOX{{{
function WB.make_bottom_wibox (s)
	s.wibox_bottom	= awful.wibar({
		position		= "bottom",
		screen			= s,
		border_width	= 0,
		height			= 20,
		bg				= theme.bg_normal,
		fg				= theme.fg_normal
	})

	s.wibox_bottom:setup {
		layout = wibox.layout.align.horizontal,
		WB.bottom_left_widgets (s),
		WB.bottom_middle_widgets (s),
		WB.bottom_right_widgets (s)
	}
end
--}}}


--}}}

-- CONKY WIBOX
