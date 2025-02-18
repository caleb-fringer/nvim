local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add to jump list" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon: View jump list" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: List item 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: List item 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: List item 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: List item 4" })

vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "Harpoon: Next item" })
vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous item" })

-- basic telescope config
