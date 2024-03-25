scriptencoding utf-8

" Palette {{{
let s:alptrueblack = "#000000"
let s:alptruewhite = "#FFFFFF"
let s:alpsnow = "#DDDDDD"
let s:alpgdirtysnow	= "#BBBBBB"
let s:alpgbrightgravel = "#999999"
let s:alpglightgravel = "#777777"
let s:alpggravel = "#555555"
let s:alpgdeepgravel = "#333333"
let s:alpgdarkgravel = "#111111"
" Sub-palette based off `skylight`
let s:alpskyvlpeach = "#FAC1A4"
let s:alpsealorange = "#FDAE76"
let s:alpskylpeach = "#FC7A62"
let s:alpseaorange = "#FF7132"
let s:alpskypeach = "#FF5D3F"
let s:alpseavlpink = "#F19298"
let s:alpskylpink = "#FA4B6A"
let s:alpseared = "#FF2E34"
let s:alpskypink = "#FF204D"
let s:alpskydeeppink = "#D50F4A"
let s:alpskyllav = "#B1B2D0"
let s:alpskylav = "#736296"
let s:alpskydlav = "#4F2958"
let s:alpskylblue = "#616C99"
let s:alpskyblue = "#183150"
let s:alpskydblue = "#061B3A"
let s:alpskyvdblue = "#030A1A"
" Sub-palette from `seaside`
let s:alpseavlbaqua = "#128FA3"
let s:alpsealbaqua = "#0C7281"
let s:alpseabaqua = "#004451"
let s:alpseadbaqua = "#003041"
let s:alpskyaqua = "#0372A0"
let s:alpsealgaqua = "#07715D"
let s:alpseagaqua = "#074747"
let s:alpseadgaqua = "#00393D"
" Pull greens from lights1k1
let s:alpauroravlgreen = "#B4F4CF"
let s:alpauroralgreen = "#6EDF9D"
let s:alpauroragreen = "#07CD56"
let s:alpaurorayellowgreen = "#8DC912"
let s:alpauroradgreen = "#005423"
let s:alpauroravdgreen = "#012011"
" }}}

let g:airline#themes#aela#palette = {}

let s:N1 = [ s:alpskyvdblue,	s:alpauroragreen, 	232 , 154 	]
let s:N2 = [ s:alpskylblue,		s:alpskydblue,	  	222 , 238 	]
let s:N3 = [ s:alpauroralgreen,	s:alpskyblue,	  	121 , 235 	]
let s:N4 = [ s:alpseaorange, 					  	241 		]
let g:airline#themes#aela#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#aela#palette.normal_modified = {
      \ 'airline_b': [ s:alpskyvdblue , s:alpseaorange 		, '', '', ''] ,
      \ 'airline_c': [ s:alpseaorange , s:alpskydblue  		, '', '', ''] }

let s:I1 = [ s:alpskyvdblue, 	s:alpseavlbaqua,  	232 , 39  	]
let s:I2 = [ s:alpskypeach,		s:alpskyblue, 	  	222 , 27  	]
let s:I3 = [ s:alpsealbaqua,	s:alpskydblue, 	  	39  , 235 	]
let g:airline#themes#aela#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#aela#palette.insert_modified = {
      \ 'airline_c': [ s:alpseaorange   , s:alpskydblue 	, '', '', ''] }
let g:airline#themes#aela#palette.insert_paste = {
      \ 'airline_a': [ s:alpskyvdblue   , s:alpskypeach 	, '', '', ''] }

let g:airline#themes#aela#palette.replace = copy(airline#themes#aela#palette.insert)
let g:airline#themes#aela#palette.replace.airline_a = [ s:alpskyvdblue , s:alpskylpink , '', '', '']
let g:airline#themes#aela#palette.replace_modified = g:airline#themes#aela#palette.insert_modified

let s:V1 = [ s:alpskyvdblue,	s:alpseaorange,   	232 , 214 	]
let s:V2 = [ s:alpskyvdblue,	s:alpsealorange,  	16  , 221 	]
let s:V3 = [ s:alpskyvdblue,	s:alpskydeeppink, 	16  , 137 	]
let s:V4 = [ s:alpskyvlpeach, 						173 		]
let g:airline#themes#aela#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#aela#palette.visual_modified = {
      \ 'airline_c': [ s:alpskyvdblue 	, s:alpskyvlpeach 	, '', '', ''] }

let s:PA = [ s:alpskypeach, 						222 		]
let s:RE = [ s:alpskylpink, 						211 		]

let s:IA = [ s:alpskyllav, 		s:alpskydblue,		s:N3[3] , s:N2[3] , '' ]
let g:airline#themes#aela#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#aela#palette.inactive_modified = {
      \ 'airline_c': [ s:alpseaorange 	, s:alpskyvdblue 	, '', '', ''] }

let g:airline#themes#aela#palette.accents = {
      \ 'red': [ s:alpseared , '' , '' , '' ]
      \ }
