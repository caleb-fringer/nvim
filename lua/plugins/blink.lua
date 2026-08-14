return {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
        },

        -- Super tab mapping
        keymap = {
            preset = 'default',

            -- Only confirms if you explicitly highlighted an item; otherwise inserts a newline
            ['<CR>'] = { 'accept', 'fallback' },

            -- Cycles menu if open, jumps forward if in a snippet, otherwise prints 'fuck' (metaphorically) and tabs
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },

        fuzzy = {
            sorts = { 'exact', 'score', 'sort_text', 'label' },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
}
