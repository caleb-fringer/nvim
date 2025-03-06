local telescope = require('telescope')
local builtin = require('telescope.builtin')
local extensions = telescope.extensions

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--hidden"
        }
    },
    extensions = {
        file_browser = {
            path = "%:p:h:",
            hidden = true,
            hijack_netrw = true,
        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Browse (LSP) symbols in current buffer"})
vim.keymap.set('n', '<leader>fe', extensions.file_browser.file_browser, { desc = "Browse directory" })
