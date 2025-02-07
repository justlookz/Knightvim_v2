return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        local map = vim.keymap.set
        require("mini.comment").setup()
        require("mini.ai").setup()
        require("mini.icons").setup()
        require("mini.surround").setup()
        require("mini.extra").setup()
        require("mini.files").setup()
        require("mini.pick").setup()
        map("n", "<leader><space>", MiniExtra.pickers.explorer,
            { desc = "Explorer" })
        map("n", "<leader>s", "",
            { desc = "+Search for ..." })
        map("n", "<leader>sb", MiniPick.builtin.buffers, { desc = "Show Buffers" })
        map("n", "<leader>sg", MiniPick.builtin.grep_live,
            { desc = "Search Files with rg" })
        map("n", "<leader>sh", MiniPick.builtin.help,
            { desc = "Search Help pages" })
        map("n", "<leader>e", MiniExtra.pickers.explorer,
            { desc = "Explorer" })
        require("mini.statusline").setup()
        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
    end,
}
