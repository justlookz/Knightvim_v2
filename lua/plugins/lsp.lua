return {
    'neovim/nvim-lspconfig', -- Required
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { 'saghen/blink.cmp' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            "folke/neodev.nvim",
            opts = {},
        },
    },
    config = function()
        -- Setup Mason
        require('mason').setup()

        -- Take capabilities from blink
        local capabilities = require('blink.cmp')
            .get_lsp_capabilities()

        -- Setup languages installed from Mason with
        -- their default settings

       local handlers = {
           -- The first entry (without a key) will be the default handler
           -- and will be called for each installed server that doesn't have
           -- a dedicated handler.
           function (server_name) -- default handler (optional)
               require("lspconfig")[server_name].setup {
                    capabilities = capabilities
               }
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
            automatic_installation = false })

        -- Setup lsp-config
        local lsp_config = require("lspconfig")

        -- Setup clangd language server for C/C++
        if vim.fn.executable("clangd") then
            lsp_config.clangd.setup({
                capabilities = capabilities })
        end

        -- Setup clangd language server for C/C++
        if vim.fn.executable("lua-language-server") then
            lsp_config.lua_ls.setup({
                capabilities = capabilities })
        end

        -- Setup gopls for Golang
        if vim.fn.executable("gopls") then
            lsp_config.gopls.setup({
                capabilities = capabilities })
        end

        -- Setup tinymist for Typst
        if vim.fn.executable("tinymist") then
            lsp_config.tinymist.setup({
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable"
                },
                capabilities = capabilities })
        end


        -- Setup Rust-analyzer for Rust
        if vim.fn.executable("rust-analyzer") then
            lsp_config.rust_analyzer.setup({
                capabilities = capabilities })
        end

        -- Setup Ruff for Python
        if vim.fn.executable("ruff") then
            lsp_config.ruff.setup({
                capabilities = capabilities })
        end
    end,
}
