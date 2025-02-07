return {
    'neovim/nvim-lspconfig', -- Required
    opts = {},
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
        require('mason-lspconfig').setup({
            automatic_installation = false })

        -- Setup lsp-config
        local lsp_config = require("lspconfig")

        -- Take capabilities from blink
        local capabilities = require('blink.cmp')
            .get_lsp_capabilities()

        -- Get Mason installed servers
        local lsp_server = require("mason-lspconfig")
            .get_installed_servers()

        -- Setup languages installed from Mason with
        -- their default settings
        for _, v in pairs(lsp_server) do
            if v ~= "jdtls" then
                lsp_config[v].setup({
                    capabilities = capabilities })
            end
        end

        -------------------------------------
        -- Setup servers for outside Mason --
        -- and jdtls with it's extra args  --
        -------------------------------------

        -- Setup lua language server for Lua
        if vim.fn.executable("lua-language-server") then
            lsp_config.lua_ls.setup({
                capabilities = capabilities })
        end

        -- Setup clangd language server for C/C++
        if vim.fn.executable("clangd") then
            lsp_config.clangd.setup({
                capabilities = capabilities })
        end

        -- Setup jdtls for Java
        if vim.fn.executable("jdtls") then
            lsp_config.jdtls.setup({
                capabilities = capabilities,
                root_dir = require('lspconfig.util')
                    .root_pattern('.git', 'pom.xml', 'build.gradle', '.classpath'),
                settings = {
                    java = {
                        project = {
                            referencedLibraries = { "lib/**/*.jar" } }
                    }
                }
            })
        end

        -- Setup gopls for Golang
        if vim.fn.executable("gopls") then
            lsp_config.gopls.setup({
                capabilities = capabilities })
        end

        -- Setup tinymist for Typst
        if vim.fn.executable("tinymist") then
            lsp_config.tinymist.setup({
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
