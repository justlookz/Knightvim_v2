require "greek_keymaps"

vim.g.mapleader = " "

require "vim._core.ui2" .enable {}

vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "nvim.tohtml"
vim.cmd.packadd "nvim.difftool"

require "option"
require "autocommand"
require "keymaps"
-- on blink removal
-- require "completion"
require "externals"
require "neovide"

vim.lsp.log.set_level(vim.log.levels.OFF)
if not vim.g.vscode then
    vim.cmd.colorscheme "monokai"
    if not vim.env.TERMUX then -- android emulator
        vim.api.nvim_set_hl(0, "Normal", { bg = nil})
    end
end
