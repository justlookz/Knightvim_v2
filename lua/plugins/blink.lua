return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    opts = {
        completion = {
            menu = {
                auto_show = false,
                draw = {
                    treesitter = { 'lsp' },
                    columns = {
                        {
                            "label",
                            "label_description",
                            gap = 1,
                        },
                        {
                            "kind_icon",
                            gap = 1,
                            "kind",
                            "source_name",
                        }
                    },
                },
            }
        },
        cmdline = {
            keymap = {
                ['<tab>']     = { function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_next()
                    else
                        return cmp.show()
                    end
                end, },
                ['<S-Tab>']   = { 'show', 'select_prev' },
                ['<CR>']      = { 'accept', 'fallback' },
                ['<C-space>'] = { 'show', 'fallback' },
                ['<C-n>']     = { 'insert_next', 'fallback' },
                ['<C-p>']     = { 'insert_prev', 'fallback' },
                ['<Right>']   = { 'select_next', 'fallback' },
                ['<Left>']    = { 'select_prev', 'fallback' },

                ['<C-y>']     = {
                    'select_and_accept',
                },
                ['<C-e>']     = { 'cancel' },
            },
            completion = { menu = { auto_show = false } },
        },
        keymap = {
            ['<C-space>'] = {
                'show',
                'show_documentation',
                'hide_documentation',
            },
            ['<C-n>']     = {
                function(cmp)
                if cmp.is_visible() then
                    return cmp.select({index = 1})
                else
                    return cmp.show()
                end
            end },
            ['<C-p>']     = {
                'show',
                function(cmp) cmp.insert_prev() end,
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
