local id = vim.api.nvim_create_augroup("LilypondFile", {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = id,
    callback = function(e)
        print("Engraving score...")
        local outfile = e.file:gsub(".ly", ".pdf")
        local result = vim.system({ "lilypond", "-o", outfile, e.file }):wait()
        if result.code ~= 0 then
            print("Error engraving score: " .. result.stderr)
        else
            print("Score saved to " .. outfile)
        end
    end
})
