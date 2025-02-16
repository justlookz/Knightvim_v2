-- Symbols for lsp
return {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = { {
        "<leader>lu",
        function() require("aerial").toggle() end,
        desc = "Toggle symbols",
    }, },
}
