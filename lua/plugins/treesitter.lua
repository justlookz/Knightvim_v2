-- Treesitter for highlighting and fold motion

local function treesitter_setup()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "sql" },

        sync_install     = false,

        auto_install     = true,

        highlight        = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
end

local function treesitter_textobjects_setup()
    require("nvim-treesitter-textobjects").setup {
        select = {
            lookahead = true,
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
            },
            include_surrounding_whitespace = false,
        },
        move = {
            set_jumps = true,
        },
    }

    vim.keymap.set({ "x", "o" }, "af", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end, { desc = "function" })
    vim.keymap.set({ "x", "o" }, "if", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end, { desc = "function" })
    vim.keymap.set({ "x", "o" }, "ac", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end, { desc = "class" })
    vim.keymap.set({ "x", "o" }, "ic", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end, { desc = "class"})
    vim.keymap.set({ "x", "o" }, "as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
    end, { desc = "local scope" })
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end, { desc = "outer function" })
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end, { desc = "outer class" })
    vim.keymap.set({ "n", "x", "o" }, "]o", function()
        move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
    end, { desc = "inner loop" })
    vim.keymap.set({ "n", "x", "o" }, "]s", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
    end, { desc = "local scope" })
    vim.keymap.set({ "n", "x", "o" }, "]z", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
    end, { desc = "next fold" })

    vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
    end, { desc = "Outer function" })
    vim.keymap.set({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
    end, { desc = "outer class" })
    vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Outer function" } )
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
    end, {desc = "outer function" })
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
    end, { desc = "outer class" })
    vim.keymap.set("n", "<leader>a", function()
        require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end, { desc = "swap argument with the next one" })
    vim.keymap.set("n", "<leader>A", function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
    end, { desc = "swap argument with the previous one" })

    local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
end

return {
    {
        "Wansmer/treesj",
        lazy = "VeryLazy",
        opts = { use_default_keymaps = false },
        keys = { {
            "<leader>m",
            function() require("treesj").toggle() end,
            desc = "Toggle split - join",
        } }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
            config = treesitter_textobjects_setup,
            lazy = false,
        },
        config = treesitter_setup,
    }
}
