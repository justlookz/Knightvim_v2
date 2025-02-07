local map = vim.keymap.set

-- Delete character without removing registers
map("n", "x", '"_x', { noremap = true })
-- buffer swapping

-- Text movement
map("i", "<A-j>", "<esc><CMD>m .+1<CR>==gi",
    { desc = "move down" })

map("i", "<A-k>", "<Esc><CMD>m .-2<CR>==gi",
    { desc = "move up" })

map("n", "<A-j>", "<CMD>m .+1<CR>==",
    { desc = "move down" })

map("n", "<A-k>", "<CMD>m .-2<CR>==",
    { desc = "move up" })

map("v", "<A-j>", ":m '>+1<CR>gv=gv",
    { desc = "move down" })

map("v", "<A-k>", ":m '<-2<CR>gv=gv",
    { desc = "move up" })

-- Centered movement
map("n", "<C-d>", "<C-d>zz",
    { desc = "Fast moving down and centered" })

map("n", "<C-u>", "<C-u>zz",
    { desc = "Fast moving down and centered" })

-- Swap buffer
map("n", "L", vim.cmd.bnext,
    { desc = "Go to next buffer" })

map("n", "H", vim.cmd.bprev,
    { desc = "Go to previous buffer" })

-- Esc instead of that to enter normal mode on terminal
map("t", "<ESC>", "<C-\\><C-n>")

-- Esc to hide highlighting from search
map("n", "<esc>", vim.cmd.nohlsearch,
    {desc = "Hide hightlighting from search"})

-- Indentation movement without losing selection
map("v", ">", ">gv", { desc = "Left indentation" })
map("v", "<", "<gv", { desc = "Right indentation" })

-- Open terminal
map( "n", "<leader>t", "<CMD>7split | terminal<CR>",
    { desc = "Terminal" })
