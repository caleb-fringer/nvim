require("sepulchre.keybindings")
require("sepulchre.lazy")

-- Since gofmt converts spaces to tabs, setting this for consistency
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
-- Enable both for hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("colorscheme rose-pine")
