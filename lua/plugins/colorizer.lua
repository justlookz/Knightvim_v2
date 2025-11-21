return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
        user_default_options = {
            css = true,
            names = false,
        },
        filetypes = {
            "*",
            css = { names = true, rgb_fn = true, oklch_fn = true, RRGGBBAA = true }, -- Enable parsing rgb(...) and oklch(...) functions in css.
            html = { names = false },                                                -- Disable parsing "names" like Blue or Gray
            sass = { names = true, },
        }
    },
}
