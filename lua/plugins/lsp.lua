local function lsp_setup()
    -- Setup Mason
    require('mason').setup()
    -- Setup languages installed from Mason with
    -- their default settings

    local handlers = {
        -- The first entry (without a key) will be the default handler
        function(server_name)     -- default handler (optional)
            vim.lsp.enable(server_name)
        end,
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
    vim.lsp.config('*', {
        root_markers = { '.git', "Makefile" },
    })

    -- Setup clangd language server for C/C++
    if vim.fn.executable("clangd") then
        vim.lsp.config("clangd", {
            cmd = { "clangd", "--clang-tidy" },
        })
        vim.lsp.enable('clangd')
    end

    -- Setup clangd language server for C/C++
    if vim.fn.executable("lua-language-server") then
        vim.lsp.enable('lua_ls')
    end

    -- Setup gopls for Golang
    if vim.fn.executable("gopls") then
        vim.lsp.enable('gopls')
    end

    -- Setup tinymist for Typst
    if vim.fn.executable("tinymist") then
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
end

return {
    'neovim/nvim-lspconfig', -- Required
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = lsp_setup,
}
