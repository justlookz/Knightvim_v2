return {
    "mbbill/undotree",
    init = function()
        vim.g.undotree_WindowLayout = 3
    end,
    keys = {
        { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
    }
}
