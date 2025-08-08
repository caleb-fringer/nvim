require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "ts_ls",
        "lua_ls",
        "pylsp",
        "jdtls",
        "volar",
        "fennel_language_server",
        "clojure_lsp",
        "gopls",
        "ansiblels",
        "tailwindcss"
    },

    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        ts_ls = function()
            local vue_typescript_plugin = require('mason-registry')
                .get_package('vue-language-server')
                :get_install_path()
                .. '/node_modules/@vue/language-server'
                .. '/node_modules/@vue/typescript-plugin'

            require('lspconfig').ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_typescript_plugin,
                            languages = { 'javascript', 'typescript', 'vue' }
                        },
                    }
                },
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                    'vue',
                },
            })
        end
    },
})
