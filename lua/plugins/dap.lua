local function dap_setup()
    local dap = require("dap")

    -- Config for gdb
    if vim.fn.executable("gdb") then
        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
            options = {
                detached = false
            }
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }

        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c
    end
end

return {
    {
        "mfussenegger/nvim-dap",
        config = dap_setup,
    },
    {
        "miroshQa/debugmaster.nvim",
        keys = {
            {
                "<leader>d", function() require("debugmaster").mode.toggle() end, desc = "Toggle debugger", nowait = true,
            },
        }
    }

}
