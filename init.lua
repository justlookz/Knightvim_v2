---@diagnostic disable: missing-fields
vim.g.mapleader = " "

require("option")
require("autocommand")
require("keymaps")

vim.lsp.log.set_level(vim.log.levels.OFF)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
--- if path none existed clone lazy to that path
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

--- This is used to load lazy from plugins folder
require("lazy").setup({
        { import = "plugins" },
    },
    ---@diagnostic disable-next-line: param-type-mismatch
    {
        install = {
            colorscheme = { "gruvbox" },
        },
        change_detection = {
            enabled = true,
            notify = false,
        },
    })

vim.cmd.colorscheme("gruvbox")
