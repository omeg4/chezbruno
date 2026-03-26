local home = os.getenv("HOME")

local _M = {
	modkey       = "Mod4",
	altkey       = "Mod1",
	terminal     = "wezterm", -- "wezterm -e fish",
	term_alt      = "kitty -e fish",
	-- terminal     = "alacritty -e byobu new-session",
	-- term_alt      = "alacritty",
	editor       = "nvim",
	gui_editor   = "wezterm -e byobu new-session -c nvim",
	browser      = "vivaldi-snapshot",
	guieditor    = "nvim",
	scrlocker    = "slock",
	wallpaper 	 = nil
}

return _M
