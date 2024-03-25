return {
    {
        'ellisonleao/gruvbox.nvim',
        priority = 100,
        opts     = {
            transparent_mode = true,
        },
        config   = function()
            -- vim.cmd 'colorscheme gruvbox'
        end,
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd 'colorscheme tokyonight-night'
        end,
    },
}
