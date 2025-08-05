return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    opts = {
        completion = {
            menu = { auto_show = false },
        },
        cmdline = {
            keymap = {
                ['<C-e>'] = { 'cancel', "hide" },
                ['<cr>'] = { 'accept', 'fallback' },
                ['<C-y>'] = { 'select_and_accept' },
                ['<tab>'] = {
                    'show_and_insert',
                    function(cmp) cmp.select_next({ }) end,
                },
                ['<S-tab>'] = {
                    'show_and_insert',
                    function(cmp) cmp.select_prev({ }) end,
                },
                ['<C-n>'] = {
                    'show_and_insert',
                    function(cmp) cmp.select_next({ }) end,
                },
                ['<C-p>'] = {
                    'show_and_insert',
                    function(cmp) cmp.select_prev({ }) end,
                },
            }
        },
        keymap = {
            ['<C-space>'] = { 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'cancel', "hide" },
            ['<C-y>'] = { 'select_and_accept', 'show_and_insert' },
            ['<C-n>'] = {
                'show_and_insert',
                function(cmp) cmp.select_next({ auto_insert = true }) end,
            },
            ['<C-p>'] = {
                'show_and_insert',
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
