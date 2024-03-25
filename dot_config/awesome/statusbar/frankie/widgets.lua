local gears  	= require("gears")
local lain   	= require("lain")
local awful  	= require("awful")
local wibox  	= require("wibox")
local markup 	= require("lain.util.markup")
local beautiful = require("beautiful")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- Create a textclock widget{{{
I.clockicon = wibox.widget.imagebox(beautiful.widget_clock)
W.mytextclock = wibox.widget.textclock(
	markup(colsch.color['sealgaqua'], "%A %d %B ") ..
	markup(colsch.color['skyaqua'], ">") ..
	markup(colsch.color['sealbaqua'], " %H:%M ")
)
W.mytextclock.font = beautiful.font
--}}}

-- Calendar widget{{{
W.cal = lain.widget.cal({
    attach_to = { W.mytextclock },
    notification_preset = {
        font = beautiful.font,
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})
--}}}

-- Weather{{{
I.weathericon = wibox.widget.imagebox(beautiful.widget_weather)
W.weather = lain.widget.weather({
    city_id = 5128581, -- New York
    notification_preset = { font = beautiful.font, bg = beautiful.bg_normal, fg = beautiful.fg_normal },
    weather_na_markup = markup.fontfg(beautiful.font, colsch.color['seavlpink'], "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['seavlpink'], descr .. " @ " .. units .. "°C "))
    end
})
--}}}

-- CPU{{{
I.cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
W.cpu = lain.widget.cpu({
    -- notification_preset = {
    --     font = beautiful.font,
    --     fg   = beautiful.fg_normal,
    --     bg   = beautiful.bg_normal
    -- },
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['skypink'], cpu_now.usage .. "% "))
    end
})
--}}}

-- Coretemp{{{
I.tempicon = wibox.widget.imagebox(beautiful.widget_temp)
W.temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['skylpink'], coretemp_now .. "°C "))
    end
})
--}}}

-- Battery{{{
I.baticon = wibox.widget.imagebox(beautiful.widget_batt)
W.bat = lain.widget.bat({
	settings = function()
		local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

		if bat_now.ac_status == 1 then
			perc = perc .. " plug"
		end

		widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, perc .. " "))
	end
})
--}}}

-- ALSA volume{{{
I.volicon = wibox.widget.imagebox(beautiful.widget_vol)
W.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
			widget:set_markup(markup.fontfg(beautiful.font, colsch.color['skypink'], volume_now.level .. "% "))
		else
			widget:set_markup(markup.fontfg(beautiful.font, colsch.color['auroralgreen'], volume_now.level .. "% "))
        end
    end
})
--}}}

-- Net{{{
I.netdownicon = wibox.widget.imagebox(beautiful.widget_netdown)
W.netdowninfo = wibox.widget.textbox()
I.netupicon = wibox.widget.imagebox(beautiful.widget_netup)
W.netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(W.weather.widget.text, "N/A")
        then
            W.weather.update()
        end

        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['seavlbaqua'], net_now.sent .. " "))
        W.netdowninfo:set_markup(markup.fontfg(beautiful.font, colsch.color['sealgaqua'], net_now.received .. " "))
    end
})--}}}

-- MEM{{{
I.memicon = wibox.widget.imagebox(beautiful.widget_mem)
W.memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['skydeeppink'], mem_now.used .. "M "))
    end
})
--}}}

-- MPD{{{
I.mpdicon = wibox.widget.imagebox()
W.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdicon:set_image(beautiful.widget_note_on)
        elseif mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            --mpdicon:set_image() -- not working in 4.0
            I.mpdicon._private.image = nil
            I.mpdicon:emit_signal("widget::redraw_needed")
            I.mpdicon:emit_signal("widget::layout_changed")
        end
        widget:set_markup(markup.fontfg(beautiful.font, colsch.color['seavlbaqua'], artist) .. markup.fontfg(beautiful.font, colsch.color['snow'], title))
    end
})
--}}}

-- New MPD (from Awesome website){{{
W.mympd = awful.widget.watch('sensors', 15, function(widget, stdout)
  for line in stdout:gmatch("[^\r\n]+") do
    if line:match("temp1") then
      widget:set_text(line)
      return
    end
  end
end)
--}}}
