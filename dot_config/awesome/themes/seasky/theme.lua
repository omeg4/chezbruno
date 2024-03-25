local gears		= require("gears")
local lain		= require("lain")
local beautiful = require("beautiful")
local awful 	= require("awful")
awful.util 		= require("awful.util")

local home = os.getenv("HOME")

-- theme_path = awful.util.getdir("config") .. "themes/" .. RC.themename .. "/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

theme_path = home .. "/.config/awesome/themes/" .. RC.themename .. "/"

require("themes." .. RC.themename .. ".elements")
require("themes." .. RC.themename .. ".icons")

theme.wallpaper         = theme_path .. "alena-aenami-skylight1920.jpg"
-- theme.wallpaper			= { theme_path .. "alena-aenami-skylight1920.jpg", theme_path .. "alena-aenami-seaside1920.jpg" }
beautiful.wallpaper 	= theme.wallpaper
-- theme.awesome_icon       = theme_path .. "launcher/logo20_kali_black.png"
-- theme.awesome_subicon    = theme_path .. "launcher/logo20_kali_black.png"

return theme
