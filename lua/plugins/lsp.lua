local function lsp_setup()
    -- Setup Mason
    require('mason').setup()
    -- Setup languages installed from Mason with
    -- their default settings

    -- setup mason lspconfig
    require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = false,
          automatic_enable = {
            exclude = {
                "jdtls", "clangd", "lua_ls",
                "tinymist", "gopls", "rust_analyzer",
            }
          }
    })

    -- Setup lsp-config
    vim.lsp.config('*', {
        root_markers = {
            '.git', "Makefile", "build.py", "build.sh",
        },
    })

    -- Setup clangd language server for C/C++
    if vim.fn.executable("clangd") == 1 then
        vim.lsp.config("clangd", {
            cmd = { "clangd", "--clang-tidy" },
        })
        vim.lsp.enable('clangd')
    end

    -- Setup lua language server for lua
    if vim.fn.executable("emmylua_ls") == 1 then
        vim.lsp.enable("emmylua_ls")
    elseif vim.fn.executable("lua-language-server") then
        vim.lsp.enable('lua_ls')
    end

    -- Setup gopls for Golang
    if vim.fn.executable("gopls") == 1 then
        vim.lsp.enable('gopls')
    end

    -- Setup tinymist for Typst
    if vim.fn.executable("tinymist") == 1 then
        vim.lsp.enable('tinymist')
    end


    -- Setup Rust-analyzer for Rust
    if vim.fn.executable("rust-analyzer") == 1 then
        vim.lsp.enable("rust_analyzer")
    end

    -- Setup Ruff for Python
    if vim.fn.executable("ruff") == 1 then
        vim.lsp.enable("ruff")
    end

    -- Setup ty for Python
    if vim.fn.executable("ty") == 1 then
        vim.lsp.enable("ty")
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
