return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        require('mason-lspconfig').setup {}

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        require('mason-tool-installer').setup {}
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
-- {
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--       local servers = {
--         clangd = {},
--         -- phpactor = {},
--         -- intelephense = {},
--         gopls = {},
--         -- jdtls = {},
--         -- pyright = {},
--         rust_analyzer = {},
--         -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
--         --
--         -- Some languages (like typescript) have entire language plugins that can be useful:
--         --    https://github.com/pmizio/typescript-tools.nvim
--         --
--         -- But for many setups, the LSP (`tsserver`) will work just fine
--         tsserver = {
--           settings = {
--             quotePreference = 'double',
--             implicitProjectConfiguration = {
--               checkJs = true,
--             },
--             javascript = {
--               format = {
--                 semicolons = 'insert',
--                 insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
--                 insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
--               },
--             },
--           },
--         },
--         lua_ls = {
--           -- cmd = {...},
--           -- filetypes { ...},
--           -- capabilities = {},
--           settings = {
--             Lua = {
--               runtime = { version = 'LuaJIT' },
--               workspace = {
--                 checkThirdParty = false,
--                 -- Tells lua_ls where to find all the Lua files that you have loaded
--                 -- for your neovim configuration.
--                 library = {
--                   '${3rd}/luv/library',
--                   unpack(vim.api.nvim_get_runtime_file('', true)),
--                 },
--                 -- If lua_ls is really slow on your computer, you can try this instead:
--                 -- library = { vim.env.VIMRUNTIME },
--               },
--               completion = {
--                 callSnippet = 'Replace',
--               },
--               -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--               -- diagnostics = { disable = { 'missing-fields' } },
--             },
--           },
--         },
--       }
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua', -- Used to format lua code
--       })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             -- This handles overriding only values explicitly passed
--             -- by the server configuration above. Useful when disabling
--             -- certain features of an LSP (for example, turning off formatting for tsserver)
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--             require('lspconfig').phpactor.setup {
--               capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}),
--             }
--           end,
--         },
--       }
--     end,
--   }
