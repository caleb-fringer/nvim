local id = vim.api.nvim_create_augroup("LilypondFile", {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = id,
    callback = function(e)
        print("Engraving score...l")
        local result = vim.system({ "lilypond", e.file }):wait()
        if result.code ~= 0 then
            print("Error engraving score: " .. result.stderr)
        end
    end
})
