local cmd = { "git", "-C", vim.fn.stdpath("config"), "pull" }

local callback = function(out)
    if out.code ~= 0 then
        vim.schedule(function()
            vim.notify(
                "Couldn't fetch latest config from Github: " .. out.stderr,
                vim.log.levels.WARN
            )
        end)
    end
end

if not pcall(vim.system, cmd, callback) then
    local msg = table.concat(cmd, " ")
    vim.notify(
        "Error executing git pull cmd: " .. msg,
        vim.log.levels.ERROR
    )
end

require("sepulchre")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
