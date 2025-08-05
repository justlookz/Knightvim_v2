---@diagnostic disable: undefined-global
return {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    config = function()
        require("mini.comment").setup()
        require("mini.icons").setup()
        require("mini.statusline").setup()
        require("mini.diff").setup()
    end,
}
