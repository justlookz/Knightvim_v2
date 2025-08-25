local libs = vim.api.nvim_get_runtime_file("lua", true)
table.insert(libs, vim.env.VIMRUNTIME .. "/lua")

return {
	cmd = {"lua-language-server"},
	filetypes = {"lua"},
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            workspace = {
				library = libs,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
