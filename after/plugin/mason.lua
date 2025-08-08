require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "lua_ls",
        "pylsp",
        "jdtls",
        "vue_ls",
        "fennel_language_server",
        "clojure_lsp",
        "gopls",
        "ansiblels",
        "tailwindcss",
        "vtsls",
    },
    automatic_enable = {
        exclude = {
            "vue_ls",
            "vtsls",
        }
    }
})

-- Vue + TS LSP setup.
local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
    '/vue-language-server' .. '/node_modules/@vue/language-server'

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

local vtsls_config = {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                }
            }
        }
    },
    filetypes = tsserver_filetypes,
}

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.enable({ 'vue_ls', 'vtsls' })
