-----------------------------------------------------------------------------------------------------------------------
--                                                   Green theme                                                     --
-----------------------------------------------------------------------------------------------------------------------
local awful = require("awful")

local theme = {}
--local wa = mouse.screen.workarea

-- Color scheme
-----------------------------------------------------------------------------------------------------------------------
theme.color = {
	main      = "#127e1f",
	gray      = "#575757",
	bg        = "#161616",
	bg_second = "#181818",
	wibox     = "#202020",
	icon      = "#a0a0a0",
	text      = "#aaaaaa",
	urgent    = "#a21e17",
	highlight = "#e0e0e0",

	border    = "#404040",
	shadow1   = "#141414",
	shadow2   = "#313131",
	shadow3   = "#1c1c1c",
	shadow4   = "#767676"
}

-- Common
-----------------------------------------------------------------------------------------------------------------------
theme.path = awful.util.get_configuration_dir() .. "themes/green"
theme.homedir = os.getenv("HOME")

-- Main config
------------------------------------------------------------

theme.panel_height        = 40 -- panel height
theme.border_width        = 4  -- window border width
theme.useless_gap         = 4  -- useless gap

theme.cellnum = { x = 96, y = 58 } -- grid layout property

theme.wallpaper = theme.path .. "/wallpaper/custom.png" -- wallpaper file

-- Fonts
------------------------------------------------------------
theme.fonts = {
	main     = "Roboto 13",      -- main font
	menu     = "Roboto 13",      -- main menu font
	tooltip  = "Roboto 13",      -- tooltip font
	notify   = "Play bold 14",   -- redflat notify popup font
	clock    = "Play bold 12",   -- textclock widget font
	qlaunch  = "Play bold 14",   -- quick launch key label font
	keychain = "Play bold 16",   -- key sequence tip font
	title    = "Roboto bold 13", -- widget titles font
	titlebar = "Roboto bold 13", -- client titlebar font
	hotkeys  = {
		main  = "Roboto 14",             -- hotkeys helper main font
		key   = "Iosevka Term Light 14", -- hotkeys helper key font (use monospace for align)
		title = "Roboto bold 16",        -- hotkeys helper group title font
	},
	player   = {
		main = "Play bold 13", -- player widget main font
		time = "Play bold 15", -- player widget current time font
	},
}

theme.cairo_fonts = {
	appswitcher = { font = "Play", size = 20, face = 1 }, -- appswitcher widget font
	navigator   = {
		title = { font = "Play", size = 28, face = 1, slant = 0 }, -- window navigation title font
		main  = { font = "Play", size = 22, face = 1, slant = 0 }  -- window navigation  main font
	},
}

-- Shared icons
--------------------------------------------------------------------------------
theme.icon = {
	check    = theme.path .. "/common/check.svg",
	blank    = theme.path .. "/common/blank.svg",
	warning  = theme.path .. "/common/warning.svg",
	awesome  = theme.path .. "/common/awesome.svg",
}

-- Widget icons
--------------------------------------------------------------------------------
theme.icon.widget = {
	battery  = theme.path .. "/widget/battery.svg",
	wireless = theme.path .. "/widget/wireless.svg",
	monitor  = theme.path .. "/widget/monitor.svg",
}


-- Desktop config
-----------------------------------------------------------------------------------------------------------------------
theme.desktop = { common = {} }

-- Common
--------------------------------------------------------------------------------
theme.desktop.line_height = 18

theme.desktop.color = {
	main  = theme.color.main,
	gray  = theme.color.gray_desktop or "#404040",
	wibox = theme.color.bg .. "00"
}

-- Textbox
------------------------------------------------------------
theme.desktop.common.textbox = {
	font = { font = "prototype", size = 24, face = 0 }
}

-- Dashbar
------------------------------------------------------------
theme.desktop.common.dashbar = {
	bar = { width = 6, gap = 6 }
}

-- Barpack
------------------------------------------------------------
theme.desktop.common.barpack = {
	label_style = { width = 68, draw = "by_width" },
	text_style  = { width = 94, draw = "by_edges" },
	line_height = theme.desktop.line_height,
	text_gap    = 14,
	label_gap   = 14,
	color       = theme.desktop.color
}

-- Widgets
--------------------------------------------------------------------------------

-- Network speed
------------------------------------------------------------
theme.desktop.speedmeter = {
	label            = { height = theme.desktop.line_height },
	dashbar          = { bar = { width = 16, gap = 6 }, height = 6 },
	chart            = { bar = { width = 6, gap = 3 }, height = 40, zero_height = 4 },
	barvalue_height  = 32,
	fullchart_height = 80,
	images           = { theme.path .. "/desktop/up.svg", theme.path .. "/desktop/down.svg" },
	image_gap        = 16,
	color            = theme.desktop.color
}

-- CPU and memory
------------------------------------------------------------
theme.desktop.multim = {
	corner       = { width = 32, corner = { num = 10, line = 3 }, plaindash = true },
	state_height = 58,
	prog_height  = 70,
	image_gap    = 16,
	color        = theme.desktop.color
}

-- Disks
------------------------------------------------------------
theme.desktop.dashpack = {
	color = theme.desktop.color
}

-- Thermal
------------------------------------------------------------
theme.desktop.sline = {
	digit_num = 2,
	lbox      = { draw = "by_width", width = 50 },
	rbox      = { draw = "by_edges", width = 60 },
	icon      = theme.path .. "/desktop/fire.svg",
	iwidth    = 142,
	color     = theme.desktop.color
}

-- Widgets placement
--------------------------------------------------------------------------------
theme.desktop.grid = {
	width  = { 480, 480, 480 },
	height = { 180, 150, 150, 138, 18 },
	edge   = { width = { 80, 80 }, height = { 50, 50 } }
}

theme.desktop.places = {
	netspeed = { 1, 1 },
	ssdspeed = { 2, 1 },
	hddspeed = { 3, 1 },
	cpumem   = { 1, 2 },
	transm   = { 1, 3 },
	disks    = { 1, 4 },
	thermal  = { 1, 5 }
}


-- Service utils config
-----------------------------------------------------------------------------------------------------------------------
theme.service = {}

-- Window control mode appearance
--------------------------------------------------------------------------------
theme.service.navigator = {
	border_width = 0,
	gradstep     = 60,
	marksize     = { width = 160, height = 80, r = 20 },
	linegap      = 32,
	titlefont    = theme.cairo_fonts.navigator.title,
	font         = theme.cairo_fonts.navigator.main,
	color        = { border = theme.color.main, mark = theme.color.gray, text = theme.color.wibox,
	                 fbg1 = theme.color.main .. "40",   fbg2 = theme.color.main .. "20",
	                 hbg1 = theme.color.urgent .. "40", hbg2 = theme.color.urgent .. "20",
	                 bg1  = theme.color.gray .. "40",   bg2  = theme.color.gray .. "20" }
}

theme.service.navigator.keytip = {}
theme.service.navigator.keytip["fairv"] = { geometry = { width = 600, height = 440 }, exit = true }
theme.service.navigator.keytip["fairh"] = theme.service.navigator.keytip["fairv"]

theme.service.navigator.keytip["tile"] = { geometry = { width = 600, height = 660 }, exit = true }
theme.service.navigator.keytip["tileleft"]   = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tiletop"]    = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tilebottom"] = theme.service.navigator.keytip["tile"]

theme.service.navigator.keytip["grid"] = { geometry = { width = 1400, height = 520 }, column = 2, exit = true }
theme.service.navigator.keytip["usermap"] = { geometry = { width = 1400, height = 580 }, column = 2, exit = true }

-- Desktop file parser
--------------------------------------------------------------------------------
theme.service.dfparser = {
	desktop_file_dirs = {
		'/usr/share/applications/',
		'/usr/local/share/applications/',
		'~/.local/share/applications',
	},
	icons = {
		df_icon       = theme.path .. "/common/system.svg",
		theme         = theme.homedir .. "/.icons/ACYLS",
		custom_only   = true,
		scalable_only = true
	}
}


-- Menu config
-----------------------------------------------------------------------------------------------------------------------
theme.menu = {
	border_width = 4,
	screen_gap   = theme.useless_gap + theme.border_width,
	height       = 32,
	width        = 250,
	icon_margin  = { 4, 7, 7, 8 },
	ricon_margin = { 9, 9, 9, 9 },
	font         = theme.fonts.menu,
	keytip       = { geometry = { width = 400, height = 380 } },
	hide_timeout = 1,
	submenu_icon = theme.path .. "/common/submenu.svg"
}

theme.menu.color = {
	border       = theme.color.wibox,
	text         = theme.color.text,
	highlight    = theme.color.highlight,
	main         = theme.color.main,
	wibox        = theme.color.wibox,
	submenu_icon = theme.color.icon
}


-- Gauge style
-----------------------------------------------------------------------------------------------------------------------
theme.gauge = { tag = {}, task = {}, icon = {}, audio = {}, monitor = {}, graph = {} }

-- Separator
------------------------------------------------------------
theme.gauge.separator = {
	marginv = { 2, 2, 4, 4 },
	marginh = { 6, 6, 3, 3 },
	color  = theme.color
}

-- Monitor
------------------------------------------------------------
theme.gauge.monitor.dash = {
	width    = 10,
	line     = { num = 5, width = 3 },
	color    = theme.color
}

-- Double icon indicator
--------------------------------------------------------------
theme.gauge.icon.double = {
	icon1       = theme.path .. "/widget/down.svg",
	icon2       = theme.path .. "/widget/up.svg",
	is_vertical = true,
	igap        = -6,
	color       = theme.color
}

-- Tag
------------------------------------------------------------
theme.gauge.tag.green = {
	width    = 44,
	margin   = { 0, 0, 8, 8 },
	color    = theme.color
}

-- Task
------------------------------------------------------------
theme.gauge.task.green = {
	width    = 40,
	df_icon  = theme.homedir .. "/.icons/ACYLS/scalable/mimetypes/application-x-executable.svg",
	-- counter  = { font = "Play 10", mask = " %d " },
	margin   = { 0, 0, 2, 2 },
	color    = theme.color
}

-- Dotcount
------------------------------------------------------------
theme.gauge.graph.dots = {
	column_num   = { 3, 5 }, -- { min, max }
	row_num      = 3,
	dot_size     = 5,
	dot_gap_h    = 5,
	color        = theme.color
}

-- Volume indicator
------------------------------------------------------------
theme.gauge.audio.red = {
	icon = {
		ready = theme.path .. "/widget/audio.svg",
		mute  = theme.path .. "/widget/mute.svg"
	},
	color = {
		main = theme.color.main,
		icon = theme.color.icon,
		mute = theme.color.urgent,
	}
}


-- Panel widgets
-----------------------------------------------------------------------------------------------------------------------
theme.widget = {}

-- individual margins for palnel widgets
------------------------------------------------------------
theme.widget.wrapper = {
	textclock   = { 10, 10, 0, 0 },
	volume      = { 12, 10, 3, 3 },
	network     = { 6, 6, 8, 8 },
	cpu         = { 10, 2, 8, 8 },
	ram         = { 2, 2, 8, 8 },
	battery     = { 2, 10, 8, 8 },
	keyboard    = { 10, 10, 5, 5 },
	mail        = { 10, 10, 5, 5 },
	tray        = { 10, 12, 8, 8 },
	taglist     = { 6, 6, 0, 0 },
	tasklist    = { 14, 0, 0, 0 }, -- centering tasklist widget
}

-- Pulseaudio volume control
------------------------------------------------------------
theme.widget.pulse = {
	notify      = { icon = theme.path .. "/widget/audio.svg" }
}

-- Brightness control
------------------------------------------------------------
theme.widget.brightness = {
	notify      = { icon = theme.path .. "/widget/brightness.svg" }
}

-- Textclock
------------------------------------------------------------
theme.widget.textclock = {
	font  = theme.fonts.clock,
	color = { text = theme.color.icon }
}

-- Keyboard layout indicator
------------------------------------------------------------
theme.widget.keyboard = {
	icon         = theme.path .. "/widget/keyboard.svg",
	micon        = theme.icon,
	layout_color = { theme.color.icon, theme.color.main }
}

theme.widget.keyboard.menu = {
	width        = 180,
	color        = { right_icon = theme.color.icon },
	nohide       = true
}

-- Upgrades
------------------------------------------------------------
theme.widget.upgrades = {
	notify      = { icon = theme.path .. "/widget/upgrades.svg" },
	color       = theme.color
}

-- Mail
------------------------------------------------------------
theme.widget.mail = {
	icon        = theme.path .. "/widget/mail.svg",
	notify      = { icon = theme.path .. "/widget/mail.svg" },
	color       = theme.color,
}

-- Minitray
------------------------------------------------------------
theme.widget.minitray = {
	border_width = 0,
	geometry     = { height = 40 },
	screen_gap   = 2 * theme.useless_gap,
	color        = { wibox = theme.color.wibox, border = theme.color.wibox },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Layoutbox
------------------------------------------------------------
theme.widget.layoutbox = {
	micon = theme.icon,
	color = theme.color
}

theme.widget.layoutbox.icon = {
	floating          = theme.path .. "/layouts/floating.svg",
	max               = theme.path .. "/layouts/max.svg",
	fullscreen        = theme.path .. "/layouts/fullscreen.svg",
	tilebottom        = theme.path .. "/layouts/tilebottom.svg",
	tileleft          = theme.path .. "/layouts/tileleft.svg",
	tile              = theme.path .. "/layouts/tile.svg",
	tiletop           = theme.path .. "/layouts/tiletop.svg",
	fairv             = theme.path .. "/layouts/fair.svg",
	fairh             = theme.path .. "/layouts/fair.svg",
	grid              = theme.path .. "/layouts/grid.svg",
	usermap           = theme.path .. "/layouts/map.svg",
	magnifier         = theme.path .. "/layouts/magnifier.svg",
	cornerne          = theme.path .. "/layouts/cornerne.svg",
	cornernw          = theme.path .. "/layouts/cornernw.svg",
	cornerse          = theme.path .. "/layouts/cornerse.svg",
	cornersw          = theme.path .. "/layouts/cornersw.svg",
	unknown           = theme.path .. "/common/unknown.svg",
}

theme.widget.layoutbox.menu = {
	icon_margin  = { 8, 12, 9, 9 },
	width        = 220,
	auto_hotkey  = true,
	nohide       = false,
	color        = { right_icon = theme.color.icon, left_icon = theme.color.icon }
}

theme.widget.layoutbox.name_alias = {
	floating          = "Floating",
	fullscreen        = "Fullscreen",
	max               = "Maximized",
	grid              = "Grid",
	usermap           = "User Map",
	tile              = "Right Tile",
	fairv             = "Fair Tile",
	tileleft          = "Left Tile",
	tiletop           = "Top Tile",
	tilebottom        = "Bottom Tile",
	magnifier         = "Magnifier",
	cornerne          = "Corner NE",
	cornernw          = "Corner NW",
	cornerse          = "Corner SE",
	cornersw          = "Corner SW",
}

-- tag icons
theme.gauge.tag.green.icon = theme.widget.layoutbox.icon

-- Tasklist
------------------------------------------------------------
theme.widget.tasklist = {
	custom_icon = true,
	need_group  = false,
	task        = theme.gauge.task.green,
}

theme.widget.tasklist.parser = {
	desktop_file_dirs = awful.util.table.join(
		theme.service.dfparser.desktop_file_dirs,
		{ '~/.local/share/applications-fake' }
	)
}

-- main
theme.widget.tasklist.winmenu = {
	micon          = theme.icon,
	titleline      = { font = theme.fonts.title, height = 25 },
	menu           = { width = 220, color = { right_icon = theme.color.icon }, ricon_margin = { 9, 9, 9, 9 } },
	state_iconsize = { width = 18, height = 18 },
	layout_icon    = theme.widget.layoutbox.icon,
	hide_action    = { min = false, move = false },
	color          = theme.color
}

-- tasktip
theme.widget.tasklist.tasktip = {
	margin = { 8, 8, 4, 4 },
	color  = theme.color
}

-- tags submenu
theme.widget.tasklist.winmenu.tagmenu = {
	width       = 180,
	icon_margin = { 9, 9, 9, 9 },
	color       = { right_icon = theme.color.icon, left_icon = theme.color.icon },
}

-- menu
theme.widget.tasklist.winmenu.icon = {
	floating             = theme.path .. "/common/window_control/floating.svg",
	sticky               = theme.path .. "/common/window_control/pin.svg",
	ontop                = theme.path .. "/common/window_control/ontop.svg",
	below                = theme.path .. "/common/window_control/below.svg",
	close                = theme.path .. "/common/window_control/close.svg",
	minimize             = theme.path .. "/common/window_control/minimize.svg",
	maximized            = theme.path .. "/common/window_control/maximized.svg",
}

-- icon aliases
theme.widget.tasklist.iconnames = {}
theme.widget.tasklist.iconnames["jetbrains-pycharm-ce"] = "pycharm"
theme.widget.tasklist.iconnames["Qemu-system-x86_64"] = "qemu"


-- Floating widgets
-----------------------------------------------------------------------------------------------------------------------
theme.float = { decoration = {} }

-- Client menu
------------------------------------------------------------
theme.float.clientmenu = {
	micon          = theme.icon,
	color          = theme.color,
	actionline     = { height = 28 },
	layout_icon    = theme.widget.layoutbox.icon,
	menu           = theme.widget.tasklist.winmenu.menu,
	state_iconsize = theme.widget.tasklist.winmenu.state_iconsize,
	tagmenu        = theme.widget.tasklist.winmenu.tagmenu,
	icon           = theme.widget.tasklist.winmenu.icon,
}

-- Audio player
------------------------------------------------------------
theme.float.player = {
	geometry     = { width = 490, height = 130 },
	screen_gap   = 2 * theme.useless_gap,
	border_gap   = { 15, 15, 15, 15 },
	elements_gap = { 15, 0, 0, 0 },
	control_gap  = { 0, 0, 14, 6 },
	line_height  = 26,
	bar_width    = 6,
	titlefont    = theme.fonts.player.main,
	artistfont   = theme.fonts.player.main,
	timefont     = theme.fonts.player.time,
	dashcontrol  = { color = theme.color, bar = { num = 7 } },
	progressbar  = { color = theme.color },
	border_width = 0,
	timeout      = 1,
	color        = theme.color
}

theme.float.player.icon = {
	cover   = theme.path .. "/common/player/cover.svg",
	next_tr = theme.path .. "/common/player/next.svg",
	prev_tr = theme.path .. "/common/player/previous.svg",
	play    = theme.path .. "/common/player/play.svg",
	pause   = theme.path .. "/common/player/pause.svg"
}

-- Application runner
------------------------------------------------------------
theme.float.apprunner = {
	itemnum       = 6,
	geometry      = { width = 620, height = 480 },
	border_margin = { 24, 24, 24, 24 },
	icon_margin   = { 8, 16, 0, 0 },
	title_height  = 48,
	prompt_height = 35,
	title_icon    = theme.path .. "/widget/search.svg",
	keytip        = { geometry = { width = 400, height = 250 } },
	border_width  = 0,
	name_font     = theme.fonts.title,
	comment_font  = theme.fonts.main,
	color         = theme.color
}

-- Application switcher
------------------------------------------------------------
theme.float.appswitcher = {
	wibox_height   = 240,
	label_height   = 28,
	title_height   = 40,
	icon_size      = 96,
	border_margin  = { 10, 10, 0, 10 },
	preview_margin = { 15, 15, 15, 15 },
	preview_format = 16 / 10,
	title_font     = theme.fonts.title,
	border_width   = 0,
	update_timeout = 1 / 12,
	keytip         = { geometry = { width = 400, height = 360 }, exit = true },
	font           = theme.cairo_fonts.appswitcher,
	color          = theme.color
}

-- additional color
theme.float.appswitcher.color.preview_bg = theme.color.main .. "12"

-- hotkeys
theme.float.appswitcher.hotkeys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
                                    "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12" }

-- Quick launcher
------------------------------------------------------------
theme.float.qlaunch = {
	geometry      = { width = 1400, height = 170 },
	border_margin = { 5, 5, 12, 15 },
	border_width  = 0,
	appline       = { iwidth = 140, im = { 5, 5, 0, 0 }, igap = { 0, 0, 5, 15 }, lheight = 26 },
	state         = { gap = 5, radius = 5, size = 10,  height = 14 },
	df_icon       = theme.path .. "/common/system.svg",
	no_icon       = theme.path .. "/common/unknown.svg",
	recoloring    = true,
	keytip        = { geometry = { width = 600, height = 320 } },
	label_font    = theme.fonts.qlaunch,
	color         = theme.color,
}

-- Hotkeys helper
------------------------------------------------------------
theme.float.hotkeys = {
	geometry      = { width = 1800, height = 1000 },
	border_margin = { 20, 20, 8, 10 },
	border_width  = 0,
	is_align      = true,
	separator     = { marginh = { 0, 0, 3, 6 } },
	font          = theme.fonts.hotkeys.main,
	keyfont       = theme.fonts.hotkeys.key,
	titlefont     = theme.fonts.hotkeys.title,
	color         = theme.color
}

-- Tooltip
------------------------------------------------------------
theme.float.tooltip = {
	margin       = { 6, 6, 3, 3 },
	timeout      = 0,
	font         = theme.fonts.tooltip,
	border_width = 2,
	color        = theme.color
}

-- Floating prompt
------------------------------------------------------------
theme.float.prompt = {
	border_width = 0,
	color        = theme.color
}

-- Top processes
------------------------------------------------------------
theme.float.top = {
	geometry      = { width = 460, height = 400 },
	screen_gap    = 2 * theme.useless_gap,
	border_margin = { 20, 20, 10, 0 },
	button_margin = { 140, 140, 18, 18 },
	title_height  = 40,
	border_width  = 0,
	bottom_height = 70,
	title_font    = theme.fonts.title,
	color         = theme.color,
	set_position  = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Key sequence tip
------------------------------------------------------------
theme.float.keychain = {
	geometry        = { width = 250, height = 56 },
	font            = theme.fonts.keychain,
	border_width    = 0,
	keytip          = { geometry = { width = 1200, height = 580 }, column = 2 },
	color           = theme.color,
}

-- Notify
------------------------------------------------------------
theme.float.notify = {
	geometry     = { width = 484, height = 106 },
	screen_gap   = 2 * theme.useless_gap,
	font         = theme.fonts.notify,
	border_width = 0,
	icon         = theme.icon.warning,
	color        = theme.color,
	progressbar  = { color = theme.color },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width, y = mouse.screen.workarea.y }
	end,
}

-- Decoration elements
------------------------------------------------------------
theme.float.decoration.button = {
	color = {
		shadow3 = theme.color.shadow3,
		shadow4 = theme.color.shadow4,
		gray    = theme.color.gray,
		text    = "#cccccc"
	},
}

theme.float.decoration.field = {
	color = theme.color
}


-- Titlebar
-----------------------------------------------------------------------------------------------------------------------
theme.titlebar = {
	size          = 8,
	position      = "top",
	font          = theme.fonts.titlebar,
	icon          = { size = 30, gap = 10 },
	border_margin = { 0, 0, 0, 4 },
	color         = theme.color,
}

-- Naughty config
-----------------------------------------------------------------------------------------------------------------------
theme.naughty = {}

theme.naughty.base = {
	timeout      = 10,
	margin       = 12,
	icon_size    = 80,
	font         = theme.fonts.main,
	bg           = theme.color.wibox,
	fg           = theme.color.text,
	height       = theme.float.notify.geometry.height,
	width        = theme.float.notify.geometry.width,
	border_width = 4,
	border_color = theme.color.wibox
}

theme.naughty.normal = {}
theme.naughty.critical = { timeout = 0, border_color = theme.color.main }
theme.naughty.low = { timeout = 5 }

-- Default awesome theme vars
-----------------------------------------------------------------------------------------------------------------------

-- colors
theme.bg_normal     = theme.color.wibox
theme.bg_focus      = theme.color.main
theme.bg_urgent     = theme.color.urgent
theme.bg_minimize   = theme.color.gray

theme.fg_normal     = theme.color.text
theme.fg_focus      = theme.color.highlight
theme.fg_urgent     = theme.color.highlight
theme.fg_minimize   = theme.color.highlight

theme.border_normal = theme.color.wibox
theme.border_focus  = theme.color.wibox
theme.border_marked = theme.color.main

-- font
theme.font = theme.fonts.main

-- misc
theme.enable_spawn_cursor = false

-- End
-----------------------------------------------------------------------------------------------------------------------
return theme
