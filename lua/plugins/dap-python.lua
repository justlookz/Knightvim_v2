return {
    'mfussenegger/nvim-dap-python',
    config = function()
        if vim.fn.executable("debugby") then
            require("dap-python").setup("python3")
        end
    end,
    ft = "python"
}
