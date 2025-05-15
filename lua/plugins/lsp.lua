return {
    'neovim/nvim-lspconfig', -- Required
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        -- Setup Mason
        require('mason').setup()

        -- Setup languages installed from Mason with
        -- their default settings

        local handlers = {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                -- require("lspconfig")[server_name].setup {
                --      capabilities = capabilities
                -- }
                vim.lsp.enable(server_name)
            end,
            -- Next, you can provide targeted overrides for specific servers.
            -- Removed default handler for global installed
            ["jdtls"] = function() end,
            ["clangd"] = function() end,
            ["lua_ls"] = function() end,
            ["tinymist"] = function() end,
            ["gopls"] = function() end,
            ["rust_analyzer"] = function() end,
        }

        -- setup mason lspconfig
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = handlers,
            automatic_installation = false
        })

        -- Setup lsp-config

        -- Setup clangd language server for C/C++
        if vim.fn.executable("clangd") then
            vim.lsp.config("clangd", {
                cmd = { "clangd", "--clang-tidy" },
            })
            vim.lsp.enable('clangd')
        end

        -- Setup clangd language server for C/C++
        if vim.fn.executable("lua-language-server") then
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            version = 'LuaJIT',
                            -- Setup your lua path
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library",
                                "${3rd}/busted/library",
                            },
                            maxPreload = 1000,
                            preloadFileSize = 50000,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            vim.lsp.enable('lua_ls')
        end

        -- Setup gopls for Golang
        if vim.fn.executable("gopls") then
            vim.lsp.enable('gopls')
        end

        -- Setup tinymist for Typst
        if vim.fn.executable("tinymist") then
            vim.lsp.config('tinymist', {
                settings = {
                    formatterMode = "typstyle",
                    semanticTokens = "disable"
                }
            })
            vim.lsp.enable('tinymist')
        end


        -- Setup Rust-analyzer for Rust
        if vim.fn.executable("rust-analyzer") then
            vim.lsp.enable("rust_analyzer")
        end

        -- Setup Ruff for Python
        if vim.fn.executable("ruff") then
            vim.lsp.enable("ruff")
        end
    end,
}
