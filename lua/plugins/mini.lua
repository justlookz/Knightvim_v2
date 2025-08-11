---@diagnostic disable: undefined-global
return {
    {
        'echasnovski/mini.comment',
        lazy = false,
        version = '*',
        opts = {}
    },
    {
        'echasnovski/mini.diff',
        lazy = false,
        version = '*',
        opts = {
            view = { style = 'number' },
            mappings = {
                apply = "<leader>ga",
                reset = "<leader>gr",
                textobject = "<leader>go",
            }
        }
    }
}
