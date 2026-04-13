vim.pack.add { "https://github.com/nvim-tree/nvim-web-devicons" }
vim.pack.add { "https://github.com/nvim-lua/plenary.nvim" }

require "externals.mini"
require "externals.lsp"
require "externals.jdtls"
require "externals.oil"
require "externals.colorizer"

vim.pack.add { "https://github.com/folke/which-key.nvim" }
vim.pack.add { "https://github.com/folke/todo-comments.nvim" }
vim.pack.add { "https://github.com/windwp/nvim-autopairs" }

vim.pack.add { "https://github.com/epheien/termdbg" }

require "which-key".setup { preset = "helix" }
require "todo-comments" .setup {}
require "nvim-autopairs".setup {}

vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
require "gruvbox".setup {
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
}
