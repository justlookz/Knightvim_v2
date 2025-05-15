return {
    {
        "mfussenegger/nvim-dap",
        config = function()
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
            end

            -- Config for lldb
            if vim.fn.executable("lldb") then
                dap.adapters.lldb = {
                    type = 'executable',
                    command = 'lldb-dap',
                    name = 'lldb'
                }
                dap.configurations.cpp = {
                    {
                        name = 'Launch',
                        type = 'lldb',
                        request = 'launch',
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = '${workspaceFolder}',
                        stopOnEntry = false,
                        args = {},

                    },
                }
                dap.configurations.c = dap.configurations.cpp
                dap.configurations.rust = dap.configurations.cpp
            end
        end,
    },
    {
        "miroshQa/debugmaster.nvim",
        config = function()
            -- local dm = require("debugmaster")
            -- -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
            -- vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
            -- vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
        end,
        keys = {
            {
            "<leader>d", function()require("debugmaster").mode.toggle() end, desc = "Toggle debugger", nowait = true,
        },
    }
}

}
