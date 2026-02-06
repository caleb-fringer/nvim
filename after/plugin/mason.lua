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
        "elixirls",
        "hls"
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
-- MUST load vtsls first, otherwise both will try to format on save.
vim.lsp.enable({ 'vtsls', 'vue_ls' })

vim.lsp.config('hls', {
    filetypes = { 'haskell', 'lhaskell' },

    on_attach = function(client, bufnr)
        local is_literate = vim.bo[bufnr].filetype == 'lhaskell'

        if is_literate then
            -- Turn off formatting for literate haskell because none of the
            -- hls formatters support it.
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentFormattingProvider = false
        end
    end,

    settings = {
        haskell = {
            formattingProvider = 'ormolu',
            cabalFormattingProvider = 'cabal-gild',
        }
    }
})
