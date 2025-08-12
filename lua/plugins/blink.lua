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
        keymap = {
            ['<C-n>'] = {
                'show_and_insert',
                function(cmp) cmp.select_next({ auto_insert = true }) end,
            },
            ['<C-p>'] = {
                'show_and_insert',
                function(cmp) cmp.select_prev({ auto_insert = true }) end,
            },
            ['<C-l>'] = { 'snippet_forward' },
            ['<C-h>'] = { 'snippet_backward' },
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
