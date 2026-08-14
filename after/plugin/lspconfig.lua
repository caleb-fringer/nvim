-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local opts = { buffer = event.buf }

        if client and client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = opts.buffer,
                callback = function()
                    vim.lsp.buf.format({ bufnr = opts.buffer })
                end
            })
        end

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function()
            vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
    end,
})

vim.api.nvim_create_user_command('LspLog',
    'tabnew ' .. vim.lsp.log.get_filename(),
    { desc = "Open LSP log" })

vim.api.nvim_create_user_command('Lsp',
    'checkhealth vim.lsp',
    { desc = "Alias for `:checkhealth vim.lsp`" })
