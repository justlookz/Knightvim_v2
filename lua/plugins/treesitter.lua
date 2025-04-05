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
                    enable = true,
                    ---@diagnostic disable-next-line: unused-local
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,

                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    }
}
