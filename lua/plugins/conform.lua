return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>cf',
            function()
                require('conform').format { async = true, lsp_fallback = false }
            end,
            mode = '',
            desc = 'Format buffer',
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            javascript = { { 'prettierd', 'prettier' } },
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500, lsp_fallback = false },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { '-i', '2' },
            },
            stylua = {
                format = {
                    defaultConfig = {
                        quote_style = 'single',
                    },
                },
            },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
