return {
    lazy = false,
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'echasnovski/mini.icons',
    },
    opts = {
        options = {
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '█', right = '' },
        },
    }
}
