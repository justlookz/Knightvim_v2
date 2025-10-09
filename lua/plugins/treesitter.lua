-- Treesitter for highlighting and fold motion 

local function treesitter_setup()
    require 'nvim-treesitter.configs'.setup {
        modules          = {},
        ignore_install   = {},
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "sql" },

        sync_install     = false,

        auto_install     = true,

        highlight        = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        textobjects      = {
            select = {
                enable = true,
                keymaps = {
                    ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                    ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                    ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                    ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                    ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                    ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                    ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                    ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                    ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                    ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                    ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                    ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                    ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
                    ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

                    ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                },
            }
        }
    }
end

return {
    {
        "Wansmer/treesj",
        opts = { use_default_keymaps = false },
        keys = { {
            "<leader>m",
            function() require("treesj").toggle() end,
            desc = "Toggle split - join",
        } }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        build = ":silent TSUpdateSync",
        config = treesitter_setup,
    }
}
