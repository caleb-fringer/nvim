local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "clangd", "ts_ls", "lua_ls", "pylsp", "jdtls", "volar" },
  handlers = {
    lsp_zero.default_setup,
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
                  languages = {'javascript', 'typescript', 'vue'}
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
