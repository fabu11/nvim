-- when exiting vim, update settings.json
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function ()
        local path = vim.fn.stdpath('config') .. "/settings.json"
        local existingData = {}
        local fp, err = io.open(path, 'r')
        if fp then
            local content = fp:read('*all')
            fp:close()
            local success, data = pcall(vim.json.decode, content)
            if success then
                existingData = data
            else
                print("Error decoding existing JSON:", data)
                return
            end
        else
            print(err, " | Creating a new settings.json file.")
        end
        local currentColorscheme = vim.g.colors_name or "onedark"
        existingData.colorscheme = currentColorscheme
        local newContent = vim.json.encode(existingData)
        local write_fp = io.open(path, 'w')
        if write_fp then
            write_fp:write(newContent)
            write_fp:close()
        else
            print("Error writing to settings.json")
        end
    end
})
