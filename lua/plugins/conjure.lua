return {
    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "python", "elixir", "javascript", "lua", "rust" }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
            -- This is VERY helpful when reporting an issue with the project
            -- vim.g["conjure#debug"] = true
            vim.g["conjure#mapping#doc_word"] = false
            vim.g["conjure#log#botright"] = true
            vim.g["conjure#log#wrap"] = true
            vim.g["conjure#extract#tree_sitter#enabled"] = true
        end,

        dependencies = {
            "Olical/nfnl"
        },
    },
}
