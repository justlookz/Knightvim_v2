local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local lsp_group = vim.api.nvim_create_augroup("lsp_group",
    { clear = true })

aucmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        map("n", "<leader>l", "", { desc = "+Lsp actions" })

        map('n', 'grh', vim.diagnostic.open_float, {
            buffer = args.buf,
            desc = 'vim.diagnostic.open_float()'
        })

        local client = vim.lsp.get_clients()[1]

        if client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        if client.server_capabilities.documentFormattingProvider then
            map('n', '<leader>lf', function()
                    vim.lsp.buf.format { async = true }
                end,
                {
                    desc = 'format file using lsp',
                    buffer = args.buf,
                })
        end

        map('n', '<leader>ld', function()
                vim.diagnostic.enable(not vim.diagnostic.is_enabled())
            end,
            {
                desc = 'Toggle Diagnostics',
                buffer = args.buf,
            })
        -- End of Keymaps --------------------

        if client then
            if client.capabilities.textDocument.inlayHint then
                map('n', "<leader>li", function()
                    vim.lsp.inlay_hint.enable(
                        vim.lsp.inlay_hint.is_enabled())
                end, {
                    desc = "Toggle inlay hint",
                    buffer = args.buf,
                })
            end
        end
    end, -- callback end
})

local yank_group = augroup("kvim-yank_group",
    { clear = true })

aucmd("TextYankPost", {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 550 })
    end,
})


aucmd("BufWinEnter", {
    group = augroup("kvim-ts-Buf-Enter", { clear = true }),
    callback = function()
        pcall(vim.cmd.loadview)
    end
})

aucmd("BufWinLeave", {
    group = augroup("kvim-ts-Buf-Leave", { clear = true }),
    callback = function()
        pcall(vim.cmd.mkview)
    end
})

aucmd("InsertEnter", {
    callback = function()
        if vim.o.nu then
            vim.o.rnu = false
        end
    end
})

aucmd("InsertLeave", {
    callback = function()
        if vim.o.nu then
            vim.o.rnu = true
        end
    end
})
