vim.keymap.set("n", "<leader>s", "", { desc = "+Search" })

vim.keymap.set(
    "n",
    "<leader>sf",
    function()
        require "telescope.builtin" .find_files()
    end,
    {desc = "Telescope find files"}
)

vim.keymap.set(
    "n",
    "<leader>sg",
    function()
        require "telescope.builtin" .live_grep()
    end,
    { desc = "Telescope live grep" }
)

vim.keymap.set(
    "n",
    "<leader>sb",
    function()
        require "telescope.builtin" .buffers()
    end,
    { desc = "Telescope buffers" }
)

vim.keymap.set(
    "n",
    "<leader>sh",
    function()
        require "telescope.builtin" .help_tags()
    end,
    { desc = "Telescope help tags" }
)
