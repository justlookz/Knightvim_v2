return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        "rafamadriz/friendly-snippets",
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
            default = { 'snippets', 'lsp', 'path', 'buffer', "omni" },
        }
    }
}
