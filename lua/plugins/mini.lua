---@diagnostic disable: undefined-global
return {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    config = function()
        require("mini.comment").setup()
        require("mini.align").setup()
        require("mini.icons").setup()
        require("mini.pick").setup()
        require("mini.extra").setup()
        require("mini.statusline").setup()
        require("mini.git").setup()
        require("mini.diff").setup({ view = { style = 'number' } })
        require("mini.pairs").setup({
            mappings = {
                ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
                ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
                ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

                [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

                ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
                ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                ["`"] = false,
            },
        })
        local miniclue = require('mini.clue')
        miniclue.setup({

            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
        require('mini.completion').setup({
            delay = {
                completion = 10 ^ 7,
                info = 100, signature = 50,
            },
            auto_setup = true,
            snippet_insert = 'mini.snippets'
        })

        local gen_loader = require('mini.snippets').gen_loader
        require('mini.snippets').setup({
            mappings = {
                expand = '<C-l>',
                jump_next = '<C-j>', jump_prev = '<C-k>',
            },
            snippets = {
                gen_loader.from_file(
                    vim.fn.stdpath('config')
                    .. '/snippets/global.json'
                ),
                gen_loader.from_file(
                    vim.fn.stdpath('data')
                    .. '/site/pack/deps/opt/friendly-snippets/package.json'
                ),
                {
                    prefix = 'cdate',
                    body = '$CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE',
                },
                gen_loader.from_lang(),
                gen_loader.from_file('.vscode/project.code-snippets'),
                function(context)
                    local rel_path = '.vscode/' .. context.lang .. '.code-snippets'
                    if vim.fn.filereadable(rel_path) == 0 then return end
                    return MiniSnippets.read_file(rel_path)
                end,
                { prefix = { 'bad', 'prefix' } },
            }
        })
    end,
    keys = {
        { "<leader><space>", function() MiniExtra.pickers.explorer() end, desc = "Open file" },
    }
}
