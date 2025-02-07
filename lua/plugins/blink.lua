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
                    preselect = true,
                    auto_insert = true,
                },
            },
        },
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide' },
            ['<C-y>'] = { 'select_and_accept', 'show' },

            ['<C-n>'] = { 'select_next', 'show', "fallback" },
            ['<C-p>'] = { 'select_prev', 'show', "fallback" },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },
        sources = {
            default = { 'snippets', 'lsp', 'path', 'buffer' },
        },
    }
}
