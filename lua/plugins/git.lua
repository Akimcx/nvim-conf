return {
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = 'x' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local function map(lhs, rhs, desc)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, { noremap = true, desc = desc })
                end
                map(
                    '<leader>gs',
                    '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                    'Stage the hunk at the cursor position, or all lines in the given range'
                )
                map(
                    '<leader>gn',
                    '<cmd>lua require"gitsigns".next_hunk()<CR>',
                    'Jump to the next hunk in the current buffer'
                )
                map(
                    '<leader>gp',
                    '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                    'Preview the hunk at the cursor position in a floating window'
                )
                map(
                    '<leader>gr',
                    '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                    'Reset the lines of the hunk at the cursor position, or all lines in the given range'
                )
            end,
        },
    },
    { 'tpope/vim-fugitive' },
}
