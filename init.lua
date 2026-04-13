---@diagnostic disable: missing-fields
vim.g.mapleader = " "

require "vim._core.ui2" .enable {}

vim.cmd.packadd "nvim.undotree"

require "option"
require "autocommand"
require "keymaps"
require "completion"
require "externals"

vim.lsp.log.set_level(vim.log.levels.OFF)

vim.cmd.colorscheme "gruvbox"
