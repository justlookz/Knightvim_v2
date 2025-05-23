-- variables for ease of use
local opt = vim.opt
local g = vim.g
local o = vim.o

-- Netrw settings

-- Remove banner
g.netrw_banner = 0

-- Change preview to a tree
g.netrw_liststyle = 3

-- Filetype settings
vim.filetype.add(
    {
        extension = { typ = "typst" }
    }
)

-- True colors
opt.termguicolors  = true

-- Options for messages
opt.shortmess      = "IfilnxtToOF"

-- Copy from clipboard
opt.clipboard      = "unnamedplus"

-- Mouse support
opt.mouse          = "a" -- all

-- Size of spaces for tabs
opt.tabstop        = 4
-- How many spaces instead of tabs
opt.shiftwidth     = 4

-- Highlight the line of cursor
opt.cursorline     = true

opt.swapfile       = false

-- Updates after this time
opt.updatetime     = 250 --ms

-- Spaces instead of tabs
opt.expandtab      = true

-- Numbers
opt.number         = true
opt.relativenumber = true

-- Split option
opt.splitright     = true
opt.splitbelow     = true

-- For search to ignore cases
opt.ignorecase     = true
opt.smartcase      = true

-- Wrap on boundaries without braking the word if possible
opt.linebreak      = true

-- Timeout options for events
opt.timeout        = true
opt.timeoutlen     = 300 -- ms

-- Encoding
opt.encoding       = "utf-8"
opt.showmode       = false

-- Confirmation for closing files
opt.confirm        = true

-- Auto indent
opt.smartindent    = true

-- Hidden buffers
opt.hidden         = true

-- History size
opt.history        = 20

-- Max syntax highlighting per column
opt.synmaxcol      = 80

-- History files for presidency
opt.undofile       = true

-- Fold options
opt.foldmethod     = "expr"
o.foldexpr         = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevelstart = 99
opt.spell          = true
---@diagnostic disable-next-line: missing-fields
opt.spelllang      = { "el", "en" }

-- Show character on those element
---@diagnostic disable-next-line: missing-fields
opt.showbreak      = "|"

---@diagnostic disable-next-line: missing-fields
opt.colorcolumn    = { 64, 78 }

-- For mkview
---@diagnostic disable-next-line: missing-fields
opt.viewoptions    = { "folds", "cursor" }

vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

vim.opt.laststatus = 3
