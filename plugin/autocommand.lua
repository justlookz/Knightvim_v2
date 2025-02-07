local map = vim.keymap.set

local lsp_group = vim.api.nvim_create_augroup("lsp_group",
    { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        map('n', 'K', vim.lsp.buf.hover,
            { buffer = args.buf, desc = "Documentation from lsp" })

        map("n", "<leader>l", "", { desc = "+Lsp actions" })

        map('n', 'gD', vim.lsp.buf.declaration, {
            buffer = args.buf,
            desc   = 'Declaration from lsp'
        })

        map('n', 'gd', vim.lsp.buf.definition, {
            buffer = args.buf,
            desc   = 'Definition from lsp'
        })

        map('n', 'gm', vim.lsp.buf.implementation, {
            buffer  = args.buf,
            desc    = 'Implementation from lsp',
            noremap = true,
        })

        map('n', 'gh', vim.lsp.buf.signature_help, {
            buffer  = args.buf,
            desc    = 'Signature help from lsp',
            noremap = true,
        })


        map('n', '<leader>la', vim.lsp.buf.code_action, {
            buffer = args.buf,
            desc   = 'Code actions from lsp'
        })

        map('n', 'gtd', vim.lsp.buf.type_definition, {
            buffer = args.buf,
            desc   = 'Definition from lsp'
        })

        map('n', '<leader>lr', vim.lsp.buf.rename, {
            buffer = args.buf,
            desc   = 'Rename a variable from lsp'
        })

        map('n', '<leader>lh', vim.diagnostic.open_float, {
            buffer = args.buf,
            desc = 'Open float diagnostic window'
        })

        map('n', ']d', vim.diagnostic.goto_next, {
            buffer = args.buf,
            desc   = "Next diagnostic"
        })

        map('n', '[d', vim.diagnostic.goto_prev, {
            buffer = args.buf,
            desc   = "Previous diagnostic",
        })

        local client = vim.lsp.get_clients()[1]

        if client.server_capabilities.documentFormattingProvider then
            map('n', '<leader>lf', function()
                    vim.lsp.buf.format { async = true }
                end,
                {
                    desc = 'format file using lsp',
                    buffer = 0,
                })
        end

        -- End of Keymaps --------------------

        if client then
            if client.server_capabilities.inlayHintProvider then
                map('n', "<leader>li", function()
                    vim.lsp.inlay_hint.enable(
                        vim.lsp.inlay_hint.is_enabled())
                end, {
                    desc = "Toggle inlay hint",
                    buffer = 0,
                })
            end
        end

        -- Highlighting word with lsp support under cursor
        if client and client.server_capabilities.documentHighlightProvider then
            local hightlight_word_group =
                vim.api.nvim_create_augroup(
                    "hightlight_word_group", { clear = true }
                )

            vim.api.nvim_create_autocmd(
                { "CursorHold", "CursorHoldI" },
                {
                    group = hightlight_word_group,
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.document_highlight()
                    end
                }
            )

            vim.api.nvim_create_autocmd(
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

local yank_group = vim.api.nvim_create_augroup("kvim-yank_group",
    { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 550 })
    end,
})


vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("kvim-ts-Buf-Enter", { clear = true }),
    callback = function()
        pcall(vim.cmd.loadview)
    end
})

vim.api.nvim_create_autocmd("BufWinLeave", {
    group = vim.api.nvim_create_augroup("kvim-ts-Buf-Leave", { clear = true }),
    callback = function()
        pcall(vim.cmd.mkview)
    end
})
