-- Symbols for lsp
return {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = { { "<leader>lu", ":AerialToggle<CR>", desc = "Toggle symbols" }, },
}
