" Monokai Pro Ristretto
" Author: ChatGPT
" Background: dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "monokai_ristretto"
set background=dark

" Palette
let s:bg        = "#2C2525"
let s:bg_alt    = "#3B3232"
let s:fg        = "#E6D9DB"
let s:comment   = "#72696A"
let s:red       = "#FD6883"
let s:green     = "#ADDA78"
let s:yellow    = "#F9CC6C"
let s:blue      = "#85DACC"
let s:purple    = "#A8A9EB"
let s:cyan      = "#85DACC"
let s:white     = "#FFF1F2"
let s:visual    = "#5A4F50"

function! s:HL(group, fg, bg, attr)
    execute "hi " . a:group .
        \ " guifg=" . a:fg .
        \ " guibg=" . a:bg .
        \ " gui=" . a:attr .
        \ " cterm=" . a:attr
endfunction

" UI
call s:HL("Normal",        s:fg,      s:bg,      "NONE")
call s:HL("CursorLine",    "NONE",    s:bg_alt,  "NONE")
call s:HL("CursorColumn",  "NONE",    s:bg_alt,  "NONE")
call s:HL("ColorColumn",   "NONE",    s:bg_alt,  "NONE")
call s:HL("LineNr",        s:comment, s:bg,      "NONE")
call s:HL("CursorLineNr",  s:yellow,  s:bg_alt,  "bold")
call s:HL("VertSplit",     s:bg_alt,  s:bg,      "NONE")
call s:HL("StatusLine",    s:fg,      s:bg_alt,  "bold")
call s:HL("StatusLineNC",  s:comment, s:bg_alt,  "NONE")
call s:HL("Visual",        "NONE",    s:visual,  "NONE")
call s:HL("Search",        s:bg,      s:yellow,  "bold")
call s:HL("IncSearch",     s:bg,      s:red,     "bold")
call s:HL("MatchParen",    s:red,     "NONE",    "bold")
call s:HL("Pmenu",         s:fg,      s:bg_alt,  "NONE")
call s:HL("PmenuSel",      s:bg,      s:blue,    "bold")

" Syntax
call s:HL("Comment",       s:comment, "NONE",    "italic")
call s:HL("Constant",      s:purple,  "NONE",    "NONE")
call s:HL("String",        s:yellow,  "NONE",    "NONE")
call s:HL("Character",     s:yellow,  "NONE",    "NONE")
call s:HL("Number",        s:purple,  "NONE",    "NONE")
call s:HL("Boolean",       s:red,     "NONE",    "bold")
call s:HL("Float",         s:purple,  "NONE",    "NONE")

call s:HL("Identifier",    s:fg,      "NONE",    "NONE")
call s:HL("Function",      s:green,   "NONE",    "bold")

call s:HL("Statement",     s:red,     "NONE",    "bold")
call s:HL("Conditional",   s:red,     "NONE",    "bold")
call s:HL("Repeat",        s:red,     "NONE",    "bold")
call s:HL("Keyword",       s:red,     "NONE",    "bold")
call s:HL("Operator",      s:fg,      "NONE",    "NONE")

call s:HL("Type",          s:blue,    "NONE",    "NONE")
call s:HL("StorageClass",  s:blue,    "NONE",    "NONE")
call s:HL("Structure",     s:blue,    "NONE",    "NONE")
call s:HL("Typedef",       s:blue,    "NONE",    "NONE")

call s:HL("PreProc",       s:purple,  "NONE",    "NONE")
call s:HL("Include",       s:red,     "NONE",    "NONE")
call s:HL("Define",        s:purple,  "NONE",    "NONE")
call s:HL("Macro",         s:purple,  "NONE",    "NONE")

call s:HL("Special",       s:cyan,    "NONE",    "NONE")
call s:HL("SpecialChar",   s:cyan,    "NONE",    "NONE")
call s:HL("Delimiter",     s:fg,      "NONE",    "NONE")

call s:HL("Error",         s:white,   s:red,     "bold")
call s:HL("Todo",          s:bg,      s:yellow,  "bold")

" Diagnostics (Neovim)
call s:HL("DiagnosticError", s:red,    "NONE", "NONE")
call s:HL("DiagnosticWarn",  s:yellow, "NONE", "NONE")
call s:HL("DiagnosticInfo",  s:blue,   "NONE", "NONE")
call s:HL("DiagnosticHint",  s:cyan,   "NONE", "NONE")

" Git
call s:HL("DiffAdd",       s:green,   s:bg,      "NONE")
call s:HL("DiffChange",    s:yellow,  s:bg,      "NONE")
call s:HL("DiffDelete",    s:red,     s:bg,      "NONE")
call s:HL("DiffText",      s:blue,    s:bg_alt,  "bold")

