vim.g.mapleader = " "

keybindings = {
    { modes="n", lhs="<leader>pv", cmd=vim.cmd.Ex },
    { modes={"n","i"}, lhs="<leader>pv", cmd=vim.cmd.Ex },
}

function wincmd_keybind_factory(arg)
    return {
	modes="n",
	lhs="<leader>w" .. arg,
	cmd=function() vim.cmd.wincmd(arg) end
    }
end

for _, i in pairs({"h","j","k","l"}) do
    table.insert(keybindings, wincmd_keybind_factory(i))
end

for _, bind in pairs(keybindings) do
    vim.keymap.set(bind.modes, bind.lhs, bind.cmd)
end

