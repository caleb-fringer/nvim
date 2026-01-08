return {
    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "python", "elixir" }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
            -- This is VERY helpful when reporting an issue with the project
            -- vim.g["conjure#debug"] = true
            vim.g["conjure#mapping#doc_word"] = false
            vim.g["conjure#log#botright"] = true
            vim.g["conjure#log#wrap"] = true
        end,

        -- Optional cmp-conjure integration
        dependencies = {
            "PaterJason/cmp-conjure",
            "Olical/nfnl"
        },
    },
    {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "conjure" })
            return cmp.setup(config)
        end,
    },
}
