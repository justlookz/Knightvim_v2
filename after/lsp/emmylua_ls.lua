return {
    root_markers = { ".luarc.json", ".git" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ";")
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    '${3rd}/luv/library',
                    '${3rd}/busted/library',
                }
            },
        }
    }
}
