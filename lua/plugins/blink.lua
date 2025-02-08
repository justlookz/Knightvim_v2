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
                    auto_insert = false,
                }
            }
        },
        keymap = {
            cmdline = {
                ['<C-e>'] = { 'hide' },
                ['<cr>'] = { 'select_and_accept', 'fallback' },
                ['<C-y>'] = { 'select_and_accept', 'show' },
                ['<tab>'] = { 'select_next', 'show', "fallback" },
                ['<S-tab>'] = { 'select_prev', 'show', "fallback" },
                ['<C-n>'] = { 'select_next', 'show', "fallback" },
                ['<C-p>'] = { 'select_prev', 'show', "fallback" },
            },

            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide' },
            ['<C-y>'] = { 'select_and_accept', 'show' },
            ['<C-n>'] = { 'select_next', 'show', "fallback" },
            ['<C-p>'] = { 'select_prev', 'show', "fallback" },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-j>'] = { 'snippet_forward' },
            ['<C-k>'] = { 'snippet_backward' },
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
