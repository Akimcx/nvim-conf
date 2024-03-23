return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },
    },
    opts = {
        jdtls = function()
            return true
        end,
    },
    config = function()
        require('mason-lspconfig').setup {}

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        require('mason-tool-installer').setup {}
        require('lspconfig').html.setup {}
        require('lspconfig').bashls.setup {}
        require('lspconfig').lua_ls.setup {
            -- https://luals.github.io/wiki/settings/
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    workspace = {
                        checkThirdParty = false,
                        -- Tells lua_ls where to find all the Lua files that you have loaded
                        -- for your neovim configuration.
                        library = {
                            '${3rd}/luv/library',
                            unpack(vim.api.nvim_get_runtime_file('', true)),
                        },
                        -- library = { vim.env.VIMRUNTIME },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    hint = {
                        enable = true,
                    },
                },
            },
        }
    end,
}
