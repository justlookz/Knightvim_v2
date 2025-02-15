return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    opts = {
        completion = {
            trigger = { show_on_keyword = false },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                }
            }
        },
        keymap = {
            cmdline = {
                ['<C-e>'] = { 'cancel', "hide" },
                ['<cr>'] = { 'accept', 'fallback' },
                ['<C-y>'] = { 'select_and_accept', 'show' },
                ['<tab>'] = {
                    'show',
                    function(cmp) cmp.select_next({ auto_insert = true }) end,
                },
                ['<S-tab>'] = {
                    'show',
                    function(cmp) cmp.select_prev({ auto_insert = true }) end,
                },
                ['<C-n>'] = {
                    'show',
                    function(cmp) cmp.select_next({ auto_insert = true }) end,
                },
                ['<C-p>'] = {
                    'show',
                    function(cmp) cmp.select_prev({ auto_insert = true }) end,
                },
            },

            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'cancel', "hide" },
            ['<C-y>'] = { 'select_and_accept', 'show' },
            ['<C-n>'] = {
                'show',
                function(cmp) cmp.select_next({ auto_insert = true }) end,
            },
            ['<C-p>'] = {
                'show',
                function(cmp) cmp.select_prev({ auto_insert = true }) end,
            },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
        },
        sources = {
            default = { 'snippets', 'lsp', 'path', 'buffer', "dadbod" },
            providers = {
                dadbod = {
                    name = "Dadbod",
                    module = "vim_dadbod_completion.blink",
                }
            }
        }
    }
}
