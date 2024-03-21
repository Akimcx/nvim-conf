-- Heavily inspired by https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations#pavva91-configuration
local jdtls = require 'jdtls'
local jdtls_setup = require 'jdtls.setup'
local home = os.getenv 'HOME'

local jdtls_package = require('mason-registry').get_package('jdtls'):get_install_path()
local jdtls_bin = jdtls_package .. '/bin/jdtls'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = jdtls_setup.find_root(root_markers)

local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/.local/share/jdtls/workspaces/' .. project_name
print(workspace_dir)

local path_to_jdtls = require('mason-registry').get_package('jdtls'):get_install_path()

local path_to_config = path_to_jdtls .. '/config_linux'

local path_to_jar = path_to_jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar'

local config = {
    flags = {
        allow_incremental_sync = true,
    },
}
config.cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar',
    path_to_jar,

    '-configuration',
    path_to_config,

    '-data',
    workspace_dir,
}

config.settings = {
    java = {
        signatureHelp = { enabled = true },
        project = {
            referencedLibraries = '/home/ksim/software/binaries/picocli/picocli-4.7.5.jar',
        },
    },
}

config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
end

local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

config.init_options = {
    extendedClientCapabilities = extendedClientCapabilities,
}
config.capabilities = capabilities
require('jdtls').start_or_attach(config)
