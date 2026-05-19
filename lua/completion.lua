local o = vim.o
local opt = vim.opt

o.pumborder = "double"

---@diagnostic disable-next-line: assign-type-mismatch
opt.completeopt = { "menu",
    "menuone",
    "nosort",
    "popup",
    "noinsert",
}

o.pummaxwidth = 30
o.pumheight = 10

local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local lsp_group = augroup("lsp_group2",
    { clear = true })

aucmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            vim.lsp.completion.enable(true, client.id, args.buf, {
                convert = function(item)
                    return { abbr = item.label:gsub('%b()', '') }
                end,
            })
            vim.keymap.set("i", "<c-space>", "<c-x><c-o>")
        end
    end
})
