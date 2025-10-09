return {
    {
        'echasnovski/mini.comment',
        lazy    = false,
        version = '*',
        opts    = {}
    },
    {
        'echasnovski/mini.diff',
        version = '*',
        opts = {
            view = { style = 'number' },
            mappings = {
                apply      = "<leader>ga",
                reset      = "<leader>gr",
                textobject = "<leader>go",
            }
        }
    },
    {
        'echasnovski/mini.align',
        version = '*',
        opts    = { },
    },
}
