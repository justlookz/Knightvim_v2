-- variables for ease of use
local opt = vim.opt
local g = vim.g

-- Netrw settings

-- Remove banner
g.netrw_banner=0

-- Change preview to a tree
g.netrw_liststyle=3

-- Filetype settings
vim.filetype.add(
    {
        extension = { typ = "typst" }
    }
)

-- True colors
opt.termguicolors = true

-- Options for messages
vim.opt.shortmess = "IfilnxtToOF"

-- Mouse support
opt.mouse = "a" -- all

-- Size of spaces for tabs
opt.tabstop = 4
-- How many spaces instead of tabs
opt.shiftwidth = 4
opt.swapfile = false

-- Updates after this time
opt.updatetime = 250 --ms

-- Spaces instead of tabs
opt.expandtab = true

-- Numbers
opt.number = true
opt.relativenumber = true

-- Split option 
opt.splitright = true
opt.splitbelow = true

-- For search to ignore cases
opt.ignorecase = true
opt.smartcase = true

-- Wrap on boundaries without braking the word if possible
opt.linebreak = true

-- Timeout options for events
opt.timeout = true
opt.timeoutlen = 300 -- ms

-- Encoding
opt.encoding = "utf-8"
opt.showmode = false

-- Confirmation for closing files
opt.confirm = true

-- Auto indent
opt.smartindent = true

-- Hidden buffers
opt.hidden = true

-- History size
opt.history = 20

-- Max syntax highlighting per column
opt.synmaxcol = 80

-- History files for presidency
opt.undofile = true

-- Fold options
opt.foldmethod     = "expr"
opt.foldexpr       = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
opt.spell          = true
opt.spelllang      = { "el", "en" }

-- Show character on those element
opt.listchars      = {
    tab = "» ",
    nbsp = "␣",
    eol = "↲",
    leadmultispace = "| ",
}
opt.showbreak      = "|"

-- For mkview
opt.viewoptions = { "folds", "cursor" }
