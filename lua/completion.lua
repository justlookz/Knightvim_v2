local o = vim.o
local opt = vim.opt

o.pumborder = "double"
o.complete = "o"

---@diagnostic disable-next-line: assign-type-mismatch
opt.completeopt = { "menu",
    "menuone",
    "fuzzy",
    "popup",
    "nearest",
    "preinsert" }
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
            })
            vim.keymap.set("i", "C-n",
                function()
                    if vim.fn.pumvisible() ~= 0 then
                        return "C-n"
                    else
                        return vim.lsp.completion.get
                    end
                end, { desc = "trigger autocompletion", expr = true })
        end
    end
})
