return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require('which-key').register {
            ['<leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = 'Document', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
            ['<leader>a'] = { name = 'Swap', _ = 'which_key_ignore' },
            ['<leader>b'] = { name = 'Buffer', _ = 'which_key_ignore' },
        }
    end,
}
