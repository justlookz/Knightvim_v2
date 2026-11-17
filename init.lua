require "greek_keymaps"

vim.g.mapleader = " "

require "vim._core.ui2" .enable {}

vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "nvim.tohtml"
vim.cmd.packadd "nvim.difftool"

require "option"
require "externals"
require "autocommand"

vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Init config lazily",
    once = true,
    callback = function()
        require "keymaps"
        -- on blink removal
        -- require "completion"
        require "neovide"
    end,
})

vim.lsp.log.set_level(vim.log.levels.OFF)
if not vim.g.vscode then
    vim.cmd.colorscheme "dark-lord"
end
