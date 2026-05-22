local cmd = { "git", "-C", vim.fn.stdpath("config"), "pull" }
local ok, sys_obj = pcall(vim.system, cmd)
if not ok then
    local msg = table.concat(cmd, " ")
    vim.notify(
        "Error executing git pull cmd: " .. msg,
        vim.log.levels.ERROR
    )
end

local result
ok, result = pcall(sys_obj.wait, sys_obj, 5000)
if not ok or result.code ~= 0 then
    vim.notify(
        "Couldn't fetch latest config from Github: " .. result.stderr,
        vim.log.levels.WARN
    )
end

require("sepulchre")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
