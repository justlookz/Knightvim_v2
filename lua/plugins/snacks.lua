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
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        image = { enabled = true },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        lazygit = { enabled = false },
    },
}
