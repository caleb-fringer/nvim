vim.g.mapleader = " "
vim.g.maplocalleader = " "

keybindings = {
    { modes="n", lhs="<leader>pv", cmd=vim.cmd.Ex },
    { modes="n", lhs="<leader>pv", cmd=vim.cmd.Ex },
    { modes={"n","i"}, lhs="<C-s>", cmd=vim.cmd.write},
}

function wincmd_keybind_factory(arg)
    return {
	modes="n",
	lhs="<leader>w" .. arg,
	cmd=function() vim.cmd.wincmd(arg) end
    }
end

for _, i in pairs({"h","j","k","l", "H", "J", "K", "L", "s", "v", "n", "q", "c"}) do
    table.insert(keybindings, wincmd_keybind_factory(i))
end

for _, bind in pairs(keybindings) do
    vim.keymap.set(bind.modes, bind.lhs, bind.cmd)
end

