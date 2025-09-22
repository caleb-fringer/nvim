require("sepulchre.keybindings")
require("sepulchre.lazy")
require("sepulchre.filetype")

-- Since gofmt converts spaces to tabs, setting this for consistency
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
-- Enable both for hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)
vim.cmd("colorscheme catppuccin-mocha")
