local beautiful 	= require("beautiful")
local colsch 		= require("themes." .. RC.colsch)
local theme_assets	= require("beautiful.theme_assets")
local xresources	= require("beautiful.xresources")
local dpi			= xresources.apply_dpi

-- theme.font 				= "MesloLGS NFM 16"
-- theme.taglist_font 		= "MesloLGS NFM 20"
theme.font 				= "MesloLGS Nerd Font Mono 16"
theme.taglist_font 		= "MesloLGS Nerd Font Mono 20"

beautiful.font 			= theme.font
beautiful.taglist_font 		= theme.taglist_font

theme.bg_normal         	= colsch.color['skyvdblue']	.. "FF" 	-- #030A1A
theme.fg_normal         	= colsch.color['snow'] .. 'FF'			-- #DDDDDD

theme.bg_focus          	= colsch.color['skyblue']		.. "FF"	-- #183150
theme.fg_focus          	= colsch.color['auroragreen'] .. 'FF'	-- #07CD56

theme.bg_urgent         	= colsch.color['skylblue'] 	.. "FF"		-- #6a6C99
theme.fg_urgent         	= colsch.color['seared'] .. 'FF'		-- #FF2E34

theme.bg_minimize			= colsch.color['seavlbaqua'] 	.. "FF"	-- #128FA3
theme.fg_minimize       	= colsch.color['skydeeppink'] .. 'FF'	-- #D50F4A

beautiful.useless_gap		= dpi(7)
theme.useless_gap			= beautiful.useless_gap --dpi(12)

theme.border_width      	= 2
theme.border_normal     	= colsch.color['skyblue'] .. 'FF'
theme.border_focus      	= colsch.color['auroralgreen'] .. 'FF'
theme.border_marked     	= colsch.color['seared'] .. 'FF'
theme.border_urgent     	= colsch.color['seared'] .. 'FF'

theme.taglist_bg_normal		= colsch.color['skyvdblue']	.. 'FF'
theme.taglist_fg_normal		= colsch.color['snow']		.. 'FF'

theme.taglist_bg_focus		= colsch.color['skylblue']	.. 'FF'
theme.taglist_fg_focus		= colsch.color['seared']	.. 'FF'
local taglist_square_size	= dpi(20)
theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
	taglist_square_size, colsch.color['seared']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_sel(
	taglist_square_size, colsch.color['sealbaqua']
)

theme.taglist_squares_sel	= theme_path .. "icons/square_a.png"
theme.taglist_squares_unsel	= theme_path .. "icons/square_b.png"

theme.menu_border_width 	= 5
theme.menu_width        	= 400
theme.menu_bg_normal    	= colsch.color['skyvdblue']	.. 'FF'
theme.menu_bg_focus     	= colsch.color['skylblue']	.. 'FF'
theme.menu_fg_normal    	= colsch.color['seavlpink']	.. 'FF'
theme.menu_fg_focus     	= colsch.color['skydeeppink']	.. 'FF'

theme.hotkeys_border_width	= 5
