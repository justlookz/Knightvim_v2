return {
    "folke/snacks.nvim",
    priority = 1000,
    init = function()
        vim.g.snacks_animate = false
    end,
    lazy = false,
---@diagnostic disable-next-line: undefined-doc-name
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = false },
        image = { enabled = false },
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
        { "<leader>g", "", desc = "+Git ..."},
        {
            "<leader>gg",
            function() Snacks.lazygit() end,
            desc = "Lazygit",
        },
        {
            "<leader>sD",
            function() Snacks.picker.lsp_declarations() end,
            desc = "Search declarations",
        },
        {
            "<leader>si",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Search implementations",
        },
        {
            "<leader>e",
            function()
                Snacks.picker.explorer(
                    {
                        layout = { layout = { position = "right" } },
                    })
            end,
            desc = "Explorer",
        },
        {
            "<leader>sw",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "Search Workspace symbols",
        },
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Search Files dynamic",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "Search symbols",
        },
        {
            "<leader>sc",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Search colorschemes",
        },
        {
            "<leader>sb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Search buffers",
        },
        {
            "<leader>sh",
            function()
                Snacks.picker.help({ layout = "select" })
            end,
            desc = "Search help",
        },
        {
            "<leader>su",
            function()
                Snacks.picker.undo()
            end,
            desc = "Search undo history",
        },
        {
            "<leader>sr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Search undo history",
        },
        {
            "<leader>sr",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep text",
        },
        {
            "<leader>t",
            function()
                Snacks.terminal.toggle()
            end,
            desc = "Terminal",
        },
    }
}
