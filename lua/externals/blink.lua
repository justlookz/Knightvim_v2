local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup {
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        documentation = { auto_show = false },
        accept = { auto_brackets = { enabled = false } },
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
        preset = "default",
        ["<c-n>"] = { "select_next", "show" }
    }
}
