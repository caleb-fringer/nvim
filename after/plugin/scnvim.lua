local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

scnvim.setup({
    documentation = {
        cmd = '/usr/bin/pandoc',
    },
    keymaps = {
        -- Requires Alacritty config to send <C-Enter> and <S-Enter>
        ['<S-Enter>'] = map('editor.send_line', { 'i', 'n' }),
        ['<C-Enter>'] = {
            map('editor.send_block', { 'i', 'n' }),
            map('editor.send_selection', 'x'),
        },
        ['<leader>er'] = {
            map('editor.send_block', { 'i', 'n' }),
            map('editor.send_selection', 'x'),
        },
        ['<leader>lg'] = map('postwin.toggle'),
        ['<leader>lr'] = map('postwin.clear', { 'n', 'i' }),
        ['C-K'] = map('signature.show', { 'n', 'i' }),
        -- Requires Alacritty config to send <C-.>
        ['<C-.>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
        ['<leader>cs'] = map('sclang.start'),
        ['<leader>cS'] = map('sclang.stop'),
        ['<leader>cr'] = map('sclang.reboot'),
        ['<leader>sk'] = map('sclang.recompile'),
        ['<F1>'] = map_expr('s.boot'),
        ['<F2>'] = map_expr('s.meter'),
    },
    editor = {
        highlight = {
            color = 'IncSearch',
        },
    },
    postwin = {
        float = {
            enabled = true,
        },
    },
})
