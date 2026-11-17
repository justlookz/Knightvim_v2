local function insert_next(cmp)
    return cmp.select_next()
end

local function show(cmp)
    return cmp.show()
end

local function insert_prev(cmp)
    return cmp.select_prev()
end

local fallback = "fallback"

local function cancel(cmp)
    return cmp.cancel()
end

local function select_and_accept(cmp)
    return cmp.select_and_accept { force = true }
end

local function snippet_forward(cmp)
    return cmp.snippet_forward()
end

local function snippet_backward(cmp)
    return cmp.snippet_backward()
end

local has_words_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

local function tab_complete(cmp)
    if has_words_before() then
        return cmp.insert_next()
    end
    return false
end

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup {
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        documentation = { auto_show = false },
        accept = { auto_brackets = { enabled = true } },
        menu = {
            auto_show = true,
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
        ["<Tab>"] = {
            tab_complete,
            insert_next,
            fallback,
        },
        -- Navigate to the previous suggestion or cancel completion if currently on the first one.
        ["<S-Tab>"] = {  
            show,
            insert_prev,
        },
        ["<C-n>"] = { insert_next, fallback },
        ["<C-p>"] = { insert_prev, fallback },
        ["<C-y>"] = { select_and_accept },
        ["<Return>"] = { select_and_accept, fallback },
        ["<C-e>"] = { cancel },
        ["<C-j>"] = { snippet_backward, fallback },
        ["<C-k>"] = { snippet_forward, fallback },
    }
}
