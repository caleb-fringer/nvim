local id = vim.api.nvim_create_augroup("PlantUML", {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = id,
    callback = function(e)
        print("Generating new uml")
        local result = vim.system({ "plantuml", e.file }):wait()
        if result.code ~= 0 then
            print("Error generating UML: " .. result.stderr)
        end
    end
})
