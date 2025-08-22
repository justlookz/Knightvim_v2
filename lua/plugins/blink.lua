return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    opts = {
        completion = {
            menu = { auto_show = false },
        },
        keymap = {
            ['<C-space>'] = {
                'show',
                'show_documentation',
                'hide_documentation',
            },
            ['<C-n>']     = {
                'show_and_insert',
                function(cmp) cmp.select_next() end,
            },
            ['<C-p>']     = {
                'show_and_insert',
                function(cmp) cmp.select_prev() end,
            },
            ['<C-l>']     = { 'snippet_forward' },
            ['<C-h>']     = { 'snippet_backward' },
            ['<C-b>']     = {
                'scroll_documentation_up',
                'fallback',
            },
            ['<C-f>']     = {
                'scroll_documentation_down',
                'fallback',
            },
        },
        sources = {
            default = { 'snippets', 'lsp', 'path', 'buffer', "lazydev", "omni" },
            providers = {
                dadbod = {
                    name = "Dadbod",
                    module = "vim_dadbod_completion.blink",
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            }
        }
    }
}
