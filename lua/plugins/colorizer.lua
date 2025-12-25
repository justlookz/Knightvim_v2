return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    lazy = true,
    opts = { -- set to setup table
        user_default_options = {
            css = true,
            names = false,
        },
        filetypes = {
            "*",
            css = { rgb_fn = true, oklch_fn = true, RRGGBBAA = true }, -- Enable parsing rgb(...) and oklch(...) functions in css.
        }
    },
}
