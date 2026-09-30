local function insert_next(cmp)
    cmp.select_next()
end

local function show(cmp)
    cmp.show()
end

local function insert_prev(cmp)
    cmp.select_prev()
end

local fallback = "fallback"

local function cancel(cmp)
    return cmp.cancel()
end

local function select_and_accept(cmp)
    cmp.select_and_accept { force = true }
end

local function snippet_forward(cmp)
    cmp.snippet_forward()
end

local function snippet_backward(cmp)
    cmp.snippet_backward()
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
            show,
            insert_next,
        },
        -- Navigate to the previous suggestion or cancel completion if currently on the first one.
        ["<S-Tab>"] = {  
            show,
            insert_prev,
        },
        ["<C-n>"] = { insert_next, fallback },
        ["<C-p>"] = { insert_prev, fallback },
        ["<C-y>"] = { select_and_accept, fallback },
        ["<C-e>"] = { cancel },
        ["<C-j>"] = { snippet_backward, fallback },
        ["<C-k>"] = { snippet_forward, fallback },
    }
}
