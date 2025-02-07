return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        lazygit = { enabled = true },
    },
    keys = {
        { "<leader>s", "", desc = "+Search for ..." },
        { "<leader>g",  function() Snacks.lazygit() end,                    desc = "Lazygit" },
        { "<leader>sD", function() Snacks.picker.lsp_declarations() end,    desc = "Search declarations" },
        { "<leader>si", function() Snacks.picker.lsp_implementations() end, desc = "Search implementations" },
        { "<leader>sw", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Search Workspace symbols" },
        { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Search colorschemes" },
        { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Search buffers" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Search help" },
    }
}
