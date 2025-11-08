return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    keys = {
        {
            "<leader>o",
            function()
                if vim.o.filetype ~= "oil" then
                    require("oil").open()
                else
                    require("oil").close()
                end
            end,
            desc = "Oil"
        },
    }
}
