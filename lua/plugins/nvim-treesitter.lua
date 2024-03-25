return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    tag = 'v0.9.2',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    config = function()
        local configs = require 'nvim-treesitter.configs'
        configs.setup {
            auto_install = true,
            indent = { enable = true },
            highlight = { enable = true },
            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>an'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>ap'] = '@parameter.inner',
                    },
                },
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'Select outer part of a function region',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'Select inner part of a function region',
                        },
                        ['ac'] = {
                            query = '@class.outer',
                            desc = 'Select outer part of a class region',
                        },
                        ['ic'] = {
                            query = '@class.inner',
                            desc = 'Select inner part of a class region',
                        },
                        ['ai'] = {
                            query = '@conditional.outer',
                            desc = 'Select outer part of a condition region',
                        },
                        ['ii'] = {
                            query = '@conditional.inner',
                            desc = 'Select inner part of a condition region',
                        },
                        ['al'] = {
                            query = '@loop.outer',
                            desc = 'Select outer part of a loop region',
                        },
                        ['il'] = {
                            query = '@loop.inner',
                            desc = 'Select inner part of a loop region',
                        },
                    },
                    include_surrounding_whitespace = function(table)
                        return true
                    end,
                },
                lsp_interop = {
                    enable = true,
                    floating_preview_opts = { border = 'none' },
                    peek_definition_code = {
                        ['<leader>df'] = '@function.outer',
                        ['<leader>dF'] = '@class.outer',
                    },
                },
            },
        }
    end,
}
