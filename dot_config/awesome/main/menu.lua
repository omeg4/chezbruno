-- Standard awesome library
local awful 		= require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful 	= require("beautiful") -- for awesome.icon
local my_table		=	awful.util.table or gears.table
local freedesktop 	= require("freedesktop")

local M 			= {}  -- menu
local _M 			= {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor 		= os.getenv("EDITOR") or "nano"
local editor_cmd 	= terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

M.myawesomemenu = {
  { "hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "arandr", "arandr" },
  { "Terminal", terminal },
  { "Shutdown/Logout", "oblogout" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end }
}

M.favorite = {
  -- { "caja", "caja" },
  -- { "thunar", "thunar" },
  -- { "geany", "geany" },
  -- { "clementine", "clementine" },
  -- { "firefox", "firefox-bin", awful.util.getdir("config") .. "/firefox.png" },
  -- { "chromium", "chromium" },
  -- { "&firefox", "firefox" },
  -- { "&thunderbird", "thunderbird-bin" },
  { "vivaldi",		"vivaldi-snapshot" },
  -- { "libreoffice", "libreoffice" },
  -- { "transmission", "transmission-gtk" },
  -- { "telegram", "telegram-desktop" },
  { "gimp", "gimp" },
  -- { "inkscape", "inkscape" },
  -- { "screenshooter", "xfce4-screenshooter" }
}

M.startup = {
  -- { "compton", "compton" },
  -- { "nm-applet", "nm-applet" },
  -- { "wicd-curses", "wicd-curses" },
  -- { "wicd-gtk", "wicd-gtk" }
}

-- {{{ Menu (ArcoFreeD)
-- local myawesomemenu = {
--     { "hotkeys", function() return false, hotkeys_popup.show_help end },
--     { "arandr", "arandr" },
-- }

awful.util.mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome", M.myawesomemenu },
        --{ "Atom", "atom" },
        -- other triads can be put here
    },
    after = {
        { "Terminal", terminal },
        { "Log out", function() awesome.quit() end },
        { "Sleep", "systemctl suspend" },
        { "Restart", "systemctl reboot" },
        { "Shutdown", "systemctl poweroff" },
        -- other triads can be put here
    }
})

-- hide menu when mouse leaves it
--awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

--menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal },
    { "tools and startup", M.startup },
    { "favorite", M.favorite }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
