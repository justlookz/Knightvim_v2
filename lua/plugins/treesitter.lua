-- treesitter - for highlighting
return {
    {
        "Wansmer/treesj",
        opts = { use_default_keymaps = false },
        keys = { {
            "<leader>f",
            function() require("treesj").toggle() end,
            desc = "Toggle split - join",
        } }
    },

    -- Symbols for lsp
    {
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
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":silent TSUpdateSync",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                modules          = {},
                ignore_install   = {},
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "sql" },

                sync_install     = false,

                auto_install     = true,

                highlight        = {
                    enable = false,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    }
}
