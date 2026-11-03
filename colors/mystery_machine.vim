" Mystery Machine palette
" Palette by valeryanaglz:
" https://www.colourlovers.com/palette/940086/mystery-machine
" CC-BY-NC-SA

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mystery_machine"
set background=dark
set termguicolors

let s:brown = "#554236"
let s:orange = "#F77825"
let s:lime = "#D3CE3D"
let s:cream = "#F1EFA5"
let s:teal = "#60B99A"

" Base
execute "hi Normal guifg=" . s:cream . " guibg=" . "NONE" . " gui=NONE"

" Bright foreground
execute "hi DiffText guifg=" . s:cream . " guibg=NONE"
execute "hi ErrorMsg guifg=" . s:orange . " guibg=NONE"
execute "hi WarningMsg guifg=" . s:orange . " guibg=NONE"
execute "hi PreProc guifg=" . s:teal . " guibg=NONE"
execute "hi Exception guifg=" . s:orange . " guibg=NONE"
execute "hi Error guifg=" . s:orange . " guibg=NONE"
execute "hi DiffDelete guifg=" . s:orange . " guibg=NONE"
execute "hi GitGutterDelete guifg=" . s:orange . " guibg=NONE"
execute "hi GitGutterChangeDelete guifg=" . s:orange . " guibg=NONE"
execute "hi cssIdentifier guifg=" . s:teal . " guibg=NONE"
execute "hi cssImportant guifg=" . s:orange . " guibg=NONE"
execute "hi Type guifg=" . s:teal . " guibg=NONE"
execute "hi Identifier guifg=" . s:cream . " guibg=NONE"

" Light foreground
execute "hi PMenuSel guifg=" . s:brown . " guibg=" . s:lime
execute "hi Constant guifg=" . s:lime . " guibg=NONE"
execute "hi Repeat guifg=" . s:lime . " guibg=NONE"
execute "hi DiffAdd guifg=" . s:teal . " guibg=NONE"
execute "hi GitGutterAdd guifg=" . s:teal . " guibg=NONE"
execute "hi cssIncludeKeyword guifg=" . s:lime . " guibg=NONE"
execute "hi Keyword guifg=" . s:lime . " guibg=NONE"

" Lime accent
execute "hi IncSearch guifg=" . s:brown . " guibg=" . s:lime
execute "hi Title guifg=" . s:lime . " guibg=NONE"
execute "hi PreCondit guifg=" . s:lime . " guibg=NONE"
execute "hi Debug guifg=" . s:lime . " guibg=NONE"
execute "hi SpecialChar guifg=" . s:lime . " guibg=NONE"
execute "hi Conditional guifg=" . s:lime . " guibg=NONE"
execute "hi Todo guifg=" . s:orange . " guibg=NONE gui=bold"
execute "hi Special guifg=" . s:lime . " guibg=NONE"
execute "hi Label guifg=" . s:lime . " guibg=NONE"
execute "hi Delimiter guifg=" . s:lime . " guibg=NONE"
execute "hi Number guifg=" . s:lime . " guibg=NONE"
execute "hi CursorLineNR guifg=" . s:lime . " guibg=NONE"
execute "hi Define guifg=" . s:lime . " guibg=NONE"
execute "hi MoreMsg guifg=" . s:teal . " guibg=NONE"
execute "hi Tag guifg=" . s:teal . " guibg=NONE"
execute "hi String guifg=" . s:teal . " guibg=NONE"
execute "hi MatchParen guifg=" . s:lime . " guibg=NONE"
execute "hi Macro guifg=" . s:lime . " guibg=NONE"
execute "hi DiffChange guifg=" . s:lime . " guibg=NONE"
execute "hi GitGutterChange guifg=" . s:lime . " guibg=NONE"
execute "hi cssColor guifg=" . s:orange . " guibg=NONE"

" Other syntax colors
execute "hi Function guifg=" . s:cream . " guibg=NONE gui=bold"
execute "hi Directory guifg=" . s:teal . " guibg=NONE"
execute "hi markdownLinkText guifg=" . s:teal . " guibg=NONE"
execute "hi javaScriptBoolean guifg=" . s:lime . " guibg=NONE"
execute "hi Include guifg=" . s:teal . " guibg=NONE"
execute "hi Storage guifg=" . s:lime . " guibg=NONE"
execute "hi cssClassName guifg=" . s:teal . " guibg=NONE"
execute "hi cssClassNameDot guifg=" . s:teal . " guibg=NONE"
execute "hi Statement guifg=" . s:orange . " guibg=NONE"
execute "hi Operator guifg=" . s:cream . " guibg=NONE"
execute "hi cssAttr guifg=" . s:cream . " guibg=NONE"

" Menus, gutters, and line numbers
execute "hi Pmenu guifg=" . s:cream . " guibg=" . s:brown
execute "hi SignColumn guibg=" . s:brown
execute "hi LineNr guifg=" . s:teal
execute "hi NonText guifg=" . s:teal

" Comments
execute "hi Comment guifg=" . s:teal . " gui=italic"
execute "hi SpecialComment guifg=" . s:teal . " gui=italic guibg=NONE"

" Cursor and tabs
execute "hi CursorLine guibg=" . s:brown
execute "hi TabLineFill gui=NONE guibg=" . s:brown
execute "hi TabLine guifg=" . s:teal . " guibg=" . s:brown . " gui=NONE"

" Status line
execute "hi StatusLine gui=bold guibg=" . s:teal . " guifg=" . s:brown
execute "hi StatusLineNC gui=NONE guibg=" . s:brown . " guifg=" . s:teal

" Search, split, and selection
execute "hi Search guibg=" . s:orange . " guifg=" . s:brown
execute "hi VertSplit gui=NONE guifg=" . s:teal . " guibg=NONE"
execute "hi Visual gui=NONE guibg=" . s:orange . " guifg=" . s:brown

