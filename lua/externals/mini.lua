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

require "mini.splitjoin".setup {}

require "mini.surround".setup {
    mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",

        suffix_last = "p",
        suffix_next = "n"
    },
}
