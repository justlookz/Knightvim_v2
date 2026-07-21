---@diagnostic disable: missing-fields, param-type-mismatch, redefined-local, unresolved-require
local has_words_before = function ()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup {
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        documentation = { auto_show = false },
        accept = { auto_brackets = { enabled = true } },
        menu = {
            auto_show = false,
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind_icon", "kind" }
                }
            }
        }
    },
    keymap = {
        preset = "none",
        ['<Tab>'] = {
            function (cmp)
                if has_words_before() then
                    return cmp.insert_next()
                end
            end,
            'fallback'
        },
        -- Navigate to the previous suggestion or cancel completion if currently on the first one.
        ['<S-Tab>'] = { 'insert_prev' },
        ['<C-y>'] = {
            function (cmp)
                return cmp.select_and_accept({ force = true })
            end,
            'fallback'
        }
    }
}
