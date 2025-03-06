local dap = require('dap')

vim.keymap.set('n', '<Leader>c', function() dap.continue() end, { desc = "[C]ontinue debugging" })
vim.keymap.set('n', '<Leader>n', function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<Leader>i', function() dap.step_into() end, { desc = "Step [i]nto" })
vim.keymap.set('n', '<Leader>o', function() dap.step_out() end, { desc = "Step [o]ut" })
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle [b]reakpoint" })
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end, { desc = "Set breakpoint" })

vim.keymap.set(
    { 'n', 'v' },
    '<Leader>dh',
    function() require('dap.ui.widgets').hover() end,
    { desc = "Hover widgets" }
)

vim.keymap.set(
    { 'n', 'v' },
    '<Leader>dp',
    function() require('dap.ui.widgets').preview() end,
    { desc = "Preview widgets" }
)

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
    },
}
