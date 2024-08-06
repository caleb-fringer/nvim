vim.keymap.set('n', '<Leader>c', function() require('dap').continue() end, { desc = "[C]ontinue debugging"})
vim.keymap.set('n', '<Leader>n', function() require('dap').step_over() end, { desc = "Step over"})
vim.keymap.set('n', '<Leader>i', function() require('dap').step_into() end, { desc = "Step [i]nto"})
vim.keymap.set('n', '<Leader>o', function() require('dap').step_out() end, { desc = "Step [o]ut"})
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle [b]reakpoint"})
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = "Set breakpoint"})
vim.keymap.set(
    {'n', 'v'},
    '<Leader>dh',
    function() require('dap.ui.widgets').hover() end,
    { desc = "Hover widgets" }
)
vim.keymap.set(
    {'n', 'v'},
    '<Leader>dp',
    function() require('dap.ui.widgets').preview() end,
    { desc = "Preview widgets"}
)
