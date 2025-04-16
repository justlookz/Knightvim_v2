return {
    "folke/snacks.nvim",
    priority = 1000,
    init = function()
        vim.g.snacks_animate = false
    end,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = [[


██   ██ ██    ██ ██ ███    ███
██  ██  ██    ██ ██ ████  ████
█████   ██    ██ ██ ██ ████ ██
██  ██   ██  ██  ██ ██  ██  ██
██   ██   ████   ██ ██      ██


                ]],
                keys = {

                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                }
            }
        },
        explorer = { enabled = false },
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
        {
            "<leader>g",
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
            "<leader>sw",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "Search Workspace symbols",
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
                Snacks.picker.help()
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
    }
}
