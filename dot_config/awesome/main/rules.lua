-- Standard and theme libraries
local awful		= require("awful")
local beautiful = require("beautiful")
-- local conky 	= require("conky")
local my_table		=	awful.util.table or gears.table

local _M = {}

-- reading: https://awesomewm.org/apidoc/libraries/awful.rules.html

function _M.get(clientkeys, clientbuttons)
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
			  properties = {
				ontop = true,
				border_width = 1
			} },

		{ rule = { class = "Godot" },
			  properties = { ontop = true, floating = true }
    },

    -- Tilda rules
    { rules = {class = "Tilda"},
      properties = {floating = true, sticky = true, ontop = true, focusable = false, skip_taskbar = true}
    },

    -- Awakened POE Trade 01/01/2024 {{{
    { rules = { class = "awakened-poe-trade" },
      properties = { ontop = true,
        titlebars_enabled = false, focusable = false,
        skip_taskbar = true }
    },

    { rules = { class = "PathOfExileSteam.exe" },
      properties = { floating = true, fullscreen = true, }
    },
    -- }}}
	}

	return rules
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
