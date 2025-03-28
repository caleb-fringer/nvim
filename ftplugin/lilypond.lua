local id = vim.api.nvim_create_augroup("LilypondFile", {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = id,
    callback = function(e)
        print("Engraving score...")
        local result = vim.system({ "lilypond", e.file }):wait()
        if result.code ~= 0 then
            print("Error engraving score. Please check :messages")
        else
            local outfile = e.file:gsub(".ly", ".pdf")
            print("Score saved to " .. outfile)
        end
    end
})
