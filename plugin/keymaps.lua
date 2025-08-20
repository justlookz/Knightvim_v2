local map = vim.keymap.set

-- Delete character without removing registers
map("n", "x", '"_x', { noremap = true, silent = true })
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

-- Keymaps for buffer
map("n", "<leader>bn", vim.cmd.bnext,
    { desc = "Go to next buffer" })
map("n", "<leader>bp", vim.cmd.bprev,
    { desc = "Go to previous buffer" })
map("n", "<leader>b", "", { desc = "+Buffer options" })
map("n", "<leader>bd", vim.cmd.bdelete,
    { desc = "Delete the current buffer" })
map("n", "<leader>bf", vim.cmd.bfirst,
    { desc = "Goto the first buffer" })
map("n", "<leader>bl", vim.cmd.blast,
    { desc = "Goto the last buffer" })

-- Terminal keymaps
-- Esc instead of that to enter normal mode on terminal
map("t", "<ESC>", "<C-\\><C-n>")

-- Esc to hide highlighting from search
map("n", "<ESC>", vim.cmd.nohlsearch,
    { desc = "Hide hightlighting from search" })

-- Indentation movement without losing selection
map("v", ">", ">gv", { desc = "Left indentation" })
map("v", "<", "<gv", { desc = "Right indentation" })

-- Movement to the line
map("n", "gh", "0", { desc = "Goto the start of the line" })
map("n", "gl", "$", { desc = "Goto the end of the line" })

-- Tab Switching
map("n", "<C-1>", "1gt", { desc = "Goto 1st tab" })
map("n", "<C-2>", "2gt", { desc = "Goto 2nd tab" })
map("n", "<C-3>", "3gt", { desc = "Goto 3rd tab" })
map("n", "<C-4>", "4gt", { desc = "Goto 4rd tab" })
map("n", "<C-5>", "5gt", { desc = "Goto 5rd tab" })
map("n", "<C-6>", "6gt", { desc = "Goto 6rd tab" })
