---@diagnostic disable: undefined-global, undefined-field, unused-local

local lush       = require("lush")
local hsl        = lush.hsl

local M          = {}

M.bnw            = {
	trueblack      = hsl("#000000"),
	truewhite      = hsl("#FFFFFF"),
	snow           = hsl("#DDDDDD"),
	dirtysnow      = hsl("#BBBBBB"),
	brightgravel   = hsl("#999999"),
	lightgravel    = hsl("#777777"),
	gravel         = hsl("#555555"),
	deepgravel     = hsl("#333333"),
	darkgravel     = hsl("#111111"),
}
M.sea            = {
	sealightorange = hsl("#FDAE76"),
	seaorange      = hsl("#FF7132"),
	--
	seavlpink      = hsl("#F19298"),
	seared         = hsl("#FF2E34"),
	--
	seavlbaqua     = hsl("#128FA3"),
	sealbaqua      = hsl("#0C7281"),
	seabaqua       = hsl("#004451"),
	seadbaqua      = hsl("#003041"),
	--
	sealgaqua      = hsl("#07715D"),
	seagaqua       = hsl("#074747"),
	seadgaqua      = hsl("#00393D"),
}
M.sky            = {
	skyvlightpeach = hsl("#FAC1A4"),
	skylightpeach  = hsl("#FC7A62"),
	skypeach       = hsl("#FF5D3F"),
	--
	skylpink       = hsl("#FA4B6A"),
	skypink        = hsl("#FF204D"),
	skydeeppink    = hsl("#D50F4A"),
	--
	skyllav        = hsl("#B1B2D0"),
	skylav         = hsl("#736296"),
	skydlav        = hsl("#4F2958"),
	--
	skylblue       = hsl("#616C99"),
	skymblue       = hsl("#183150"),
	skydblue       = hsl("#061B3A"),
	skyvdblue      = hsl("#030A1A"),
	--
	skyaqua        = hsl("#0372A0"),
}
M.aur            = {
	aurvlgreen     = hsl("#B4F4CF"),
	aurlgreen      = hsl("#6EDF9D"),
	aurgreen       = hsl("#07CD56"),
	auryellowgreen = hsl("#8DC912"),
	aurdgreen      = hsl("#005423"),
	aurvdgreen     = hsl("#012011"),
}

return M
