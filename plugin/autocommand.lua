local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local lsp_group = vim.api.nvim_create_augroup("lsp_group",
    { clear = true })

aucmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        map('n', 'K', vim.lsp.buf.hover,
            { buffer = args.buf, desc = "Documentation from lsp" })

        map("n", "<leader>l", "", { desc = "+Lsp actions" })

        map('n', 'gD', vim.lsp.buf.declaration, {
            buffer = args.buf,
            desc   = 'vim.lsp.buf.declaration()'
        })

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
            if client.server_capabilities.inlayHintProvider then
                map('n', "<leader>li", function()
                    vim.lsp.inlay_hint.enable(
                        vim.lsp.inlay_hint.is_enabled())
                end, {
                    desc = "Toggle inlay hint",
                    buffer = args.buf,
                })
            end
        end

        -- Highlighting word with lsp support under cursor
        if client and client.server_capabilities.documentHighlightProvider then
            local hightlight_word_group =
                augroup(
                    "hightlight_word_group", { clear = true }
                )

            aucmd(
                { "CursorHold", "CursorHoldI" },
                {
                    group = hightlight_word_group,
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.document_highlight()
                    end
                }
            )

            aucmd(
                { "CursorMoved", "CursorMovedI" },
                {
                    group = hightlight_word_group,
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references
                }
            )
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

local init_vim = augroup("kvim-init-vim", { clear = true })
