local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item({behavior = 'select'})
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    })
})

cmp.setup.filetype({ 'lisp' }, {
    sources = {
        { name = 'nvlime' }
    }
})
