vim.pack.add {
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/mfussenegger/nvim-jdtls",
    'https://github.com/neovim/nvim-lspconfig', -- Required
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/stevearc/oil.nvim',
    "https://github.com/folke/which-key.nvim",
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/epheien/termdbg",
    "https://github.com/ellisonleao/gruvbox.nvim",
    {
        src = 'https://github.com/echasnovski/mini.comment',
        version = vim.version.range("*"),
    },

    {
        src = 'https://github.com/echasnovski/mini.diff',
        version = vim.version.range("*"),
    },
    {
        src = 'https://github.com/echasnovski/mini.align',
        version = vim.version.range("*"),
    },
}

require "externals.mini"
require "externals.lsp"
require "externals.jdtls"
require "externals.oil"
require "externals.colorizer"


require "which-key".setup { preset = "helix" }
require "todo-comments".setup {}
require "nvim-autopairs".setup {}

require "gruvbox".setup {
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
}
