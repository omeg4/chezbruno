" My first custom nvim colorscheme
" Based on the beautiful artwork of Aela Aenami
" Specifically the pieces "skylight" and "seaside"
" (My desktop wallpapers)
" Formatting based heavily off of Badwolf (github.com/sjl/badwolf)
"
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

set background=dark
highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "aela"

if !exists("g:badwolf_html_link_underline") " {{{
    let g:badwolf_html_link_underline = 1
endif " }}}

if !exists("g:badwolf_css_props_highlight") " {{{
    let g:badwolf_css_props_highlight = 0
endif " }}}

" }}}
" Palette {{{

let s:ac                   = {}
"
let s:ac.trueblack         = ['#000000', 16]
let s:ac.truewhite         = ['#FFFFFF', 15]

let s:ac.snow              = ['#DDDDDD', 15]

let s:ac.gdirtysnow        = ['#BBBBBB', 252]
let s:ac.gbrightgravel     = ['#999999', 245]
let s:ac.glightgravel      = ['#777777', 243]
let s:ac.ggravel           = ['#555555', 241]
let s:ac.gdeepgravel       = ['#333333', 236]
let s:ac.gdarkgravel       = ['#111111', 232]

" Sub-palette based off skylight
let s:ac.skyvlpeach        = ['#FAC1A4', 222]
let s:ac.sealorange        = ['#FDAE76', 167]
let s:ac.skylpeach         = ['#FC7A62', 196]
let s:ac.seaorange         = ['#FF7132', 168]
let s:ac.skypeach          = ['#FF5D3F', 214]

let s:ac.seavlpink         = ['#F19298', 169]
let s:ac.skylpink          = ['#FA4B6A', 211]
let s:ac.seared            = ['#FF2E34', 170]
let s:ac.skypink           = ['#FF204D', 211]
let s:ac.skydeeppink       = ['#D50F4A', 211]

let s:ac.skyllav           = ['#B1B2D0', 180]
let s:ac.skylav            = ['#736296', 181]
let s:ac.skydlav           = ['#4F2958', 182]

let s:ac.skylblue          = ['#616C99', 182]
let s:ac.skyblue           = ['#183150', 183]
let s:ac.skydblue          = ['#061B3A', 184]
let s:ac.skyvdblue         = ['#030A1A', 185]

" Sub-palette from seaside
let s:ac.seavlbaqua        = ['#128FA3', 149]
let s:ac.sealbaqua         = ['#0C7281', 150]
let s:ac.seabaqua          = ['#004451', 151]
let s:ac.seadbaqua         = ['#003041', 152]

let s:ac.skyaqua           = ['#0372A0', 153]

let s:ac.sealgaqua         = ['#07715D', 160]
let s:ac.seagaqua          = ['#074747', 161]
let s:ac.seadgaqua         = ['#00393D', 162]

" Pull greens from lights1k1
let s:ac.auroravlgreen     = ['#B4F4CF', 180]
let s:ac.auroralgreen      = ['#6EDF9D', 181]
let s:ac.auroragreen       = ['#07CD56', 182]
let s:ac.aurorayellowgreen = ['#8DC912', 189]
let s:ac.auroradgreen      = ['#005423', 183]
let s:ac.auroravdgreen     = ['#012011', 184]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg '
        else
            let c = get(s:ac, a:fg)
            let histring .= 'guifg=' . c[0] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg '
        else
            let c = get(s:ac, a:1)
            let histring .= 'guibg=' . c[0] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:ac, a:3)
        let histring .= 'guisp=' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Configuration Options {{{

let s:gutter = 'skydblue'

let s:tabline = 'skydblue'

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'truewhite', 'skyvdblue')

call s:HL('Folded', 'skylblue', 'bg', 'none')

call s:HL('VertSplit', 'gbrightgravel', 'bg', 'none')

call s:HL('CursorLine',   '', 'skydblue', 'none')
call s:HL('CursorColumn', '', 'skydblue')
call s:HL('ColorColumn',  '', 'skydblue')

call s:HL('TabLine', 'snow', s:tabline, 'none')
call s:HL('TabLineFill', 'snow', s:tabline, 'none')
call s:HL('TabLineSel', 'trueblack', 'skyaqua', 'none')

call s:HL('MatchParen', 'skypeach', 'skydblue', 'bold')

call s:HL('NonText',    'ggravel', 'bg')
call s:HL('SpecialKey', 'ggravel', 'bg')

call s:HL('Visual',    'none',  'ggravel')
call s:HL('VisualNOS', 'none',  'ggravel')

call s:HL('Search',    'trueblack', 'skypeach', 'bold')
call s:HL('IncSearch', 'trueblack', 'skyaqua',    'bold')

call s:HL('Underlined', 'fg', 'none', 'underline')

call s:HL('StatusLine',   'trueblack', 'skyaqua', 'bold')
call s:HL('StatusLineNC', 'truewhite', 'ggravel', 'bold')

call s:HL('Directory', 'sealorange', 'none', 'bold')

call s:HL('Title', 'auroragreen')

call s:HL('ErrorMsg',   'skypink',       	'bg',	'bold')
call s:HL('MoreMsg',    'skypeach',   		'',   	'bold')
call s:HL('ModeMsg',    'sealorange', 		'',   	'bold')
call s:HL('Question',   'sealorange', 		'',   	'bold')
call s:HL('WarningMsg', 'seavlpink',       	'',   	'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', 'none', 'none', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('LineNr',     'skylblue', s:gutter)
call s:HL('SignColumn', 'auroragreen',	s:gutter)
call s:HL('FoldColumn', 'skylblue', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'trueblack', 'skyaqua', 'bold')
call s:HL('vCursor', 'trueblack', 'skyaqua', 'bold')
call s:HL('iCursor', 'trueblack', 'skyaqua', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'snow')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'skylblue')
call s:HL('Todo',           'truewhite', 'bg', 'bold')
call s:HL('SpecialComment', 'truewhite', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'skyvlpeach')

" Control flow stuff is taffy.
call s:HL('Statement',   'skypink', 'none', 'bold')
call s:HL('Keyword',     'skypink', 'none', 'bold')
call s:HL('Conditional', 'skypink', 'none', 'bold')
call s:HL('Operator',    'skypink', 'none', 'none')
call s:HL('Label',       'skypink', 'none', 'none')
call s:HL('Repeat',      'skypink', 'none', 'none')

" Functions and variable declarations are orange, because plain looks weird.
call s:HL('Identifier', 'skydeeppink', 'none', 'none')
call s:HL('Function',   'skydeeppink', 'none', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'auroragreen', 'none', 'none')
call s:HL('Macro',     'auroragreen', 'none', 'none')
call s:HL('Define',    'auroragreen', 'none', 'none')
call s:HL('PreCondit', 'auroragreen', 'none', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'skylblue', 'none', 'bold')
call s:HL('Character', 'skylblue', 'none', 'bold')
call s:HL('Boolean',   'skylblue', 'none', 'bold')

call s:HL('Number', 'skylblue', 'none', 'bold')
call s:HL('Float',  'skylblue', 'none', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'seavlpink', 'none', 'bold')

call s:HL('Type', 'seavlpink', 'none', 'none')
call s:HL('StorageClass', 'skypink', 'none', 'none')
call s:HL('Structure', 'skypink', 'none', 'none')
call s:HL('Typedef', 'skypink', 'none', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'auroragreen', 'none', 'bold')

" Misc
call s:HL('Error',  'truewhite',   'skypink', 'bold')
call s:HL('Debug',  'truewhite',   'none',      'bold')
call s:HL('Ignore', 'gbrightgravel', 'none',      'none')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'snow', 'skydblue')
call s:HL('PmenuSel', 'trueblack', 'skyaqua', 'bold')
call s:HL('PmenuSbar', 'none', 'skydblue')
call s:HL('PmenuThumb', 'dirtysnow')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'trueblack', 'trueblack')
call s:HL('DiffAdd',    'none',     'skydblue')
call s:HL('DiffChange', 'none',     'skydblue')
call s:HL('DiffText',   'truewhite', 'skydblue', 'bold')

" }}}
" Spelling {{{

" if has("spell")
"     call s:HL('SpellCap', 'skypeach', 'bg', 'undercurl,bold', 'skypeach')
"     call s:HL('SpellBad', 'none', 'bg', 'undercurl', 'skypeach')
"     call s:HL('SpellLocal', 'none', 'none', 'undercurl', 'skypeach')
"     call s:HL('SpellRare', 'none', 'none', 'undercurl', 'skypeach')
" endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'truewhite', 'skypink', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'skydeeppink', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'ggravel', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'ggravel', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'snow', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'trueblack', 'skyaqua', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'trueblack', 'skyaqua', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'trueblack', 'skyaqua', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'trueblack', 'skyaqua', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'skyaqua',     'bg', 'bold')
call s:HL('EasyMotionShade',  'ggravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'trueblack', 'skydeeppink')
call s:HL('InterestingWord2', 'trueblack', 'auroragreen')
call s:HL('InterestingWord3', 'trueblack', 'auroralgreen')
call s:HL('InterestingWord4', 'trueblack', 'skylblue')
call s:HL('InterestingWord5', 'trueblack', 'seavlpink')
call s:HL('InterestingWord6', 'trueblack', 'skypink')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'glightgravel',   'none', 'bold')
call s:HL('level15c', 'skypeach',      'none', 'none')
call s:HL('level14c', 'seavlpink',          'none', 'none')
call s:HL('level13c', 'skydeeppink',         'none', 'none')
call s:HL('level12c', 'skyaqua',         'none', 'none')
call s:HL('level11c', 'auroragreen',           'none', 'none')
call s:HL('level10c', 'skylblue',         'none', 'none')
call s:HL('level9c',  'auroralgreen', 'none', 'none')
call s:HL('level8c',  'skylblue',         'none', 'none')
call s:HL('level7c',  'skypeach',      'none', 'none')
call s:HL('level6c',  'seavlpink',          'none', 'none')
call s:HL('level5c',  'skydeeppink',         'none', 'none')
call s:HL('level4c',  'skyaqua',         'none', 'none')
call s:HL('level3c',  'auroragreen',           'none', 'none')
call s:HL('level2c',  'skylblue',         'none', 'none')
call s:HL('level1c',  'auroralgreen', 'none', 'none')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'skyaqua', 'skydblue')
call s:HL('ShowMarksHLu', 'skyaqua', 'skydblue')
call s:HL('ShowMarksHLo', 'skyaqua', 'skydblue')
call s:HL('ShowMarksHLm', 'skyaqua', 'skydblue')

" }}}

" }}}
" Filetype-specific {{{

" Mathematica {{{
call s:HL('mmaPureFunction',	'sky.aqua',		'', 'bold')
call s:HL('mmaSysFunc',			'auroralgreen',	'',	'none')
call s:HL('mmaSystemSymbol',	'skydeeppink',	'',	'bold')
call s:HL('mmaSymbol',			'dirtysnow',			'',	'none')
call s:HL('mmaOperator',		'skypeach',		'none',	'none')
call s:HL('mmaNumber',			'seaorange',		'none',	'none')
" }}}

"" Clojure {{{

"call s:HL('clojureSpecial',  'skypink', 'none', 'none')
"call s:HL('clojureDefn',     'skypink', 'none', 'none')
"call s:HL('clojureDefMacro', 'skypink', 'none', 'none')
"call s:HL('clojureDefine',   'skypink', 'none', 'none')
"call s:HL('clojureMacro',    'skypink', 'none', 'none')
"call s:HL('clojureCond',     'skypink', 'none', 'none')

"call s:HL('clojureKeyword', 'skydeeppink', 'none', 'none')

"call s:HL('clojureFunc',   'seavlpink', 'none', 'none')
"call s:HL('clojureRepeat', 'seavlpink', 'none', 'none')

"call s:HL('clojureParen0', 'gbrightgravel', 'none', 'none')

"call s:HL('clojureAnonArg', 'truewhite', 'none', 'bold')

"" }}}
"" Common Lisp {{{

"call s:HL('lispFunc',           'aurorayellowgreen', 'none', 'none')
"call s:HL('lispVar',            'skydeeppink', 'none', 'bold')
"call s:HL('lispEscapeSpecial',  'skydeeppink', 'none', 'none')

"" }}}
"" CSS {{{

"if g:badwolf_css_props_highlight
    "call s:HL('cssColorProp', 'skypink', 'none', 'none')
    "call s:HL('cssBoxProp', 'skypink', 'none', 'none')
    "call s:HL('cssTextProp', 'skypink', 'none', 'none')
    "call s:HL('cssRenderProp', 'skypink', 'none', 'none')
    "call s:HL('cssGeneratedContentProp', 'skypink', 'none', 'none')
"else
    "call s:HL('cssColorProp', 'fg', 'none', 'none')
    "call s:HL('cssBoxProp', 'fg', 'none', 'none')
    "call s:HL('cssTextProp', 'fg', 'none', 'none')
    "call s:HL('cssRenderProp', 'fg', 'none', 'none')
    "call s:HL('cssGeneratedContentProp', 'fg', 'none', 'none')
"end

"call s:HL('cssValueLength', 'skylblue', 'none', 'bold')
"call s:HL('cssColor', 'skylblue', 'none', 'bold')
"call s:HL('cssBraces', 'gbrightgravel', 'none', 'none')
"call s:HL('cssIdentifier', 'skydeeppink', 'none', 'bold')
"call s:HL('cssClassName', 'skydeeppink', 'none', 'none')

"" }}}
" Diff {{{

call s:HL('gitDiff', 'gbrightgravel', 'none',)

call s:HL('diffRemoved', 'seavlpink', 'none',)
call s:HL('diffAdded', 'auroragreen', 'none',)
call s:HL('diffFile', 'trueblack', 'skypink', 'bold')
call s:HL('diffNewFile', 'trueblack', 'skypink', 'bold')

call s:HL('diffLine', 'trueblack', 'skydeeppink', 'bold')
call s:HL('diffSubname', 'skydeeppink', 'none', 'none')

" }}}
"" Django Templates {{{

"call s:HL('djangoArgument', 'sealorange', 'none',)
"call s:HL('djangoTagBlock', 'skydeeppink', 'none')
"call s:HL('djangoVarBlock', 'skydeeppink', 'none')
"" hi djangoStatement guifg=#ff3853 gui=bold
"" hi djangoVarBlock guifg=#f4cf86

"" }}}
"" HTML {{{

"" Punctuation
"call s:HL('htmlTag',    'seabaqua', 'bg', 'none')
"call s:HL('htmlEndTag', 'seabaqua', 'bg', 'none')

"" Tag names
"call s:HL('htmlTagName',        'skylblue', 'none', 'bold')
"call s:HL('htmlSpecialTagName', 'skylblue', 'none', 'bold')
"call s:HL('htmlSpecialChar',    'auroragreen',   'none', 'none')

"" Attributes
"call s:HL('htmlArg', 'skylblue', 'none', 'none')

"" Stuff inside an <a> tag

"if g:badwolf_html_link_underline
    "call s:HL('htmlLink', 'gbrightgravel', 'none', 'underline')
"else
    "call s:HL('htmlLink', 'gbrightgravel', 'none', 'none')
"endif

"" }}}
"" Java {{{

"call s:HL('javaClassDecl', 'skypink', 'none', 'bold')
"call s:HL('javaScopeDecl', 'skypink', 'none', 'bold')
"call s:HL('javaCommentTitle', 'gbrightgravel', 'none')
"call s:HL('javaDocTags', 'truewhite', 'none', 'none')
"call s:HL('javaDocParam', 'skypeach', 'none', 'none')

"" }}}
" LaTeX {{{

call s:HL('texStatement', 	'seavlbaqua',	 		'none', 'none')
call s:HL('texMathZoneX', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneA', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneB', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneC', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneD', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneE', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneV', 	'seaorange', 			'none', 'none')
call s:HL('texMathZoneX', 	'seaorange', 			'none', 'none')
call s:HL('texMath', 		'seaorange', 			'none', 'none')
call s:HL('texMathMatcher', 'sealorange', 			'none', 'none')
call s:HL('texRefLabel', 	'sealorange', 			'none', 'none')
call s:HL('texRefZone', 	'auroralgreen', 			'none', 'none')
call s:HL('texComment', 	'skylblue', 			'none', 'none')
call s:HL('texDelimiter', 	'skydeeppink', 			'none', 'none')
call s:HL('texZone', 		'dirtysnow', 			'none', 'none')
call s:HL('texInputFile',	'auroralgreen',			'none',	'none')
call s:HL('texInputFileOpt','auroragreen',			'none',	'bold')
call s:HL('texAccent',		'seavlpink',			'none',	'none')
call s:HL('texMatcher',		'auroragreen',			'none',	'none')
call s:HL('Delimiter',		'skypink',				'none',	'none')
call s:HL('texParen',		'skylpink',				'none',	'none')
call s:HL('texBeginEnd',	'skydeeppink',			'none',	'bold')
call s:HL('texBeginEndName','auroragreen',			'none',	'bold')
call s:HL('texSection',		'auroragreen',			'none',	'bold')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'auroragreen', 'none', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'auroragreen', 'none', 'none')
call s:HL('lispyscriptRepeat', 'seavlpink', 'none', 'none')

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call s:HL('replPrompt', 'skyaqua', 'none', 'bold')

" }}}
" Mail {{{

call s:HL('mailSubject', 'skydeeppink', 'none', 'bold')
call s:HL('mailHeader', 'gbrightgravel', 'none', 'none')
call s:HL('mailHeaderKey', 'gbrightgravel', 'none', 'none')
call s:HL('mailHeaderEmail', 'truewhite', 'none', 'none')
call s:HL('mailURL', 'skylblue', 'none', 'underline')
call s:HL('mailSignature', 'gbrightgravel', 'none', 'none')

call s:HL('mailQuoted1', 'gbrightgravel', 'none', 'none')
call s:HL('mailQuoted2', 'seavlpink', 'none', 'none')
call s:HL('mailQuoted3', 'sealorange', 'none', 'none')
call s:HL('mailQuoted4', 'skydeeppink', 'none', 'none')
call s:HL('mailQuoted5', 'auroragreen', 'none', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownHeadingDelimiter', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownOrderedListMarker', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownListMarker', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownItalic', 'truewhite', 'none', 'bold')
call s:HL('markdownBold', 'truewhite', 'none', 'bold')
call s:HL('markdownH1', 'skydeeppink', 'none', 'bold')
call s:HL('markdownH2', 'auroragreen', 'none', 'bold')
call s:HL('markdownH3', 'auroragreen', 'none', 'none')
call s:HL('markdownH4', 'auroragreen', 'none', 'none')
call s:HL('markdownH5', 'auroragreen', 'none', 'none')
call s:HL('markdownH6', 'auroragreen', 'none', 'none')
call s:HL('markdownLinkText', 'skylblue', 'none', 'underline')
call s:HL('markdownIdDeclaration', 'skylblue')
call s:HL('markdownAutomaticLink', 'skylblue', 'none', 'bold')
call s:HL('markdownUrl', 'skylblue', 'none', 'bold')
call s:HL('markdownUrldelimiter', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownLinkDelimiter', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownLinkTextDelimiter', 'gbrightgravel', 'none', 'bold')
call s:HL('markdownCodeDelimiter', 'sealorange', 'none', 'bold')
call s:HL('markdownCode', 'sealorange', 'none', 'none')
call s:HL('markdownCodeBlock', 'sealorange', 'none', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'seavlpink', 'none', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'seavlpink')
call s:HL('pythonBuiltinObj',  'seavlpink')
call s:HL('pythonBuiltinFunc', 'seavlpink')
call s:HL('pythonEscape',      'seavlpink')
call s:HL('pythonException',   'auroragreen', 'none', 'bold')
call s:HL('pythonExceptions',  'auroragreen', 'none', 'none')
call s:HL('pythonPrecondit',   'auroragreen', 'none', 'none')
call s:HL('pythonDecorator',   'skypink', 'none', 'none')
call s:HL('pythonRun',         'gbrightgravel', 'none', 'bold')
call s:HL('pythonCoding',      'gbrightgravel', 'none', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gbrightgravel')
call s:HL('hlLevel1', 'skydeeppink')
call s:HL('hlLevel2', 'auroralgreen')
call s:HL('hlLevel3', 'seavlpink')
call s:HL('hlLevel4', 'skylblue')
call s:HL('hlLevel5', 'sealorange')
call s:HL('hlLevel6', 'skydeeppink')
call s:HL('hlLevel7', 'auroralgreen')
call s:HL('hlLevel8', 'seavlpink')
call s:HL('hlLevel9', 'skylblue')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'gbrightgravel', 'none', 'bold')

call s:HL('VimMapMod',    'seavlpink', 'none', 'none')
call s:HL('VimMapModKey', 'seavlpink', 'none', 'none')
call s:HL('VimNotation', 'seavlpink', 'none', 'none')
call s:HL('VimBracket', 'seavlpink', 'none', 'none')

" }}}

" }}}

