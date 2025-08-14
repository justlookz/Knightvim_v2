local function dap_setup()
    local dap = require("dap")

    -- Config for gdb
    if vim.fn.executable("gdb") then
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                pid = function()
                    local name = vim.fn.input('Executable name (filter): ')
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = '${workspaceFolder}'
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'gdb',
                request = 'attach',
                target = 'localhost:1234',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}'
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
