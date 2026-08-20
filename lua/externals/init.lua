vim.pack.add {
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",
    'https://github.com/neovim/nvim-lspconfig', -- Required
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/stevearc/oil.nvim',
    "https://github.com/folke/which-key.nvim",
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/epheien/termdbg",
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/NeogitOrg/neogit",
    {
        src = "https://github.com/echasnovski/mini.comment",
        version = "stable"
    },

    {
        src = "https://github.com/echasnovski/mini.diff",
        version = "stable"
    },
    {
        src = "https://github.com/echasnovski/mini.align",
        version = "stable"
    },
    {
        src = "https://github.com/nvim-mini/mini.splitjoin",
        version = "stable"
    },
    {
        src = "https://github.com/nvim-mini/mini.surround",
        version = "stable"
    },
}

require "externals.mini"
require "externals.lsp"
if not vim.g.vscode then
    require "externals.oil"
    require "externals.colorizer"
end

require "externals.blink"

require "externals.telescope"
require "which-key".setup { preset = "helix" }
require "todo-comments".setup {}
require "nvim-autopairs".setup {}

vim.keymap.set("n", "<leader>g", "", { desc = "+Git" })

vim.keymap.set(
    "n",
    "<leader>gg",
    function() require "neogit".open({ kind = "split" }) end,
    { desc = "Open Neogit UI" }
)
