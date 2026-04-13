vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

require "oil" .setup {}

vim.keymap.set("n", "<leader>o",
    function()
        if vim.o.filetype ~= "oil" then
            require("oil").open()
        else
            require("oil").close()
        end
    end,
    { desc = "Oil" }
)
