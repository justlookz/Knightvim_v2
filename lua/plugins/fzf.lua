return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { "telescope" },
    keys = {
        { "<leader>s", "", desc = "+Search" },
        {
            "<leader><leader>",
            function() require("fzf-lua").global() end,
            desc = "Global"
        },
        {
            "<leader>sg",
            function() require("fzf-lua").grep() end,
            desc = "Grep",
        },
        {
            "<leader>sR",
            function() require("fzf-lua").resume() end,
            desc = "Resume last search"
        },
        {
            "<leader>sG",
            function() require("fzf-lua").live_grep() end,
            desc = "Grep with preview"
        },
        {
            "<leader>sh",
            function() require("fzf-lua").helptags() end,
            desc = "Help"
        },
        {
            "<leader>sm",
            function() require("fzf-lua").manpages() end,
            desc = "Man pages"
        },
        {
            "<leader>sc",
            function() require("fzf-lua").colorschemes() end,
            desc = "Colorschemes"
        },
        {
            "<leader>sk",
            function() require("fzf-lua").keymaps() end,
            desc = "Keymaps"
        },
        {
            "<leader>f", "", desc = "find"
        },
        {
            "<leader>sf",
            function() require("fzf-lua").files() end,
            desc = "files"
        },
        {
            "<leader>so",
            function() require("fzf-lua").oldfiles() end,
            desc = "old files"
        },
        {
            "<leader>sb",
            function() require("fzf-lua").buffers() end,
            desc = "buffers"
        },
    }
}
