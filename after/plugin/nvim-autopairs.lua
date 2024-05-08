local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm done',
    cmp_autopairs.on_confirm_done()
)
