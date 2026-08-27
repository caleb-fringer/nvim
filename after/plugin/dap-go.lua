local dap = require("dap")

require("dap-go").setup()

for _, config in ipairs(dap.configurations.go or {}) do
    -- Conditionally resolve subvolume symlinks to make sure breakpoints
    -- reference the absolute path, as required by dlv.
    if vim.fn.resolve("/home/caleb/src") == "/data/src" then
        config.substitutePath = {
            {
                from = "/home/caleb/src",
                to = "/data/src",
            },
            {
                from = "/data/src",
                to = "/home/caleb/src",
            },
        }
    end
end
