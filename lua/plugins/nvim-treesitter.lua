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
                        -- You can also use captures from other query groups like `locals.scm`
                        -- ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
                    },
                    -- You can choose the select mode (default is charwise 'v')
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * method: eg 'v' or 'o'
                    -- and should return the mode ('v', 'V', or '<c-v>') or a table
                    -- mapping query_strings to modes.
                    -- selection_modes = {
                    --   ['@parameter.outer'] = 'v', -- charwise
                    --   ['@function.outer'] = 'v',  -- linewise
                    --   ['@class.outer'] = '<c-v>', -- blockwise
                    -- },
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * selection_mode: eg 'v'
                    -- and should return true or false
                    include_surrounding_whitespace = function(table)
                        -- print(table.query_string)
                        -- print(table.selection_mode)
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