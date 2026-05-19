return {
    root_markers = { "luac.json", ".git" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ";")
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fs.normalize(vim.env.VIMRUNTIME .. "/lua"),
                    '${3rd}/luv/library',
                    '${3rd}/busted/library',
                    vim.fn.stdpath('data') .. "/lua",
                    vim.fn.stdpath('data'),
                }
            },
        }
    }
}
