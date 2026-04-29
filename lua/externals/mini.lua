require "mini.comment".setup {}

vim.keymap.set("n", "<leaded>g", "", { desc = "Git.. " })

require "mini.diff".setup {
    view = { style = 'number' },
    mappings = {
        apply      = "<leader>ga",
        reset      = "<leader>gr",
        textobject = "<leader>go",
    }
}

require "mini.align".setup {}
