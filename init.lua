local configrepo = "https://github.com/caleb-fringer/nvim"
local cmd = { "git", "pull", configrepo }
local ok, sys_obj = pcall(vim.system, cmd)
if not ok then
    local msg = table.concat(cmd, " ")
    vim.notify("Error executing command: " .. msg)
end
local ok, result = pcall(sys_obj.wait, sys_obj, 5000)
if not ok or result.code ~= 0 then
    vim.notify("Error fetching latest config from Github: " .. result.stderr)
end

require("sepulchre")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
