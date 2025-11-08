return { {
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
                ['<tab>']     = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.select_next()
                        end
                        return cmp.show()
                    end,
                },
                ['<S-Tab>']   = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.select_prev()
                        end
                        return cmp.show()
                    end,
                },
                ['<CR>']      = { 'accept', 'fallback' },
                ['<C-space>'] = { 'show', 'fallback' },
                ['<C-n>']     = { 'select_next', 'fallback' },
                ['<C-p>']     = { 'select_prev', 'fallback' },
                ['<Down>']    = { 'select_next', 'fallback' },
                ['<Up>']      = { 'select_prev', 'fallback' },

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
                        return cmp.select_next({ index = 1 })
                    else
                        return cmp.show()
                    end
                end },
            ['<C-p>']     = {
                function(cmp)
                    if cmp.is_visible() then
                        cmp.select_prev()
                    else
                        return cmp.show()
                    end
                end,
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
            default = { 'lsp', 'snippets', 'path', 'buffer', "omni" },
        }
    }
},
    {
        'saghen/blink.indent',
        --- @module 'blink.indent'
        --- @type blink.indent.Config
        opts = {},
        lazy = false,
    }
}
