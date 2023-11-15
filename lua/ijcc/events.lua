-- Hack to show Splash screen + file tree... 
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local is_no_file = vim.fn.argc() == 0
        local is_dir = vim.fn.argc() == 1 and vim.fn.argv(0) == "NvimTree_1"
        vim.cmd("NvimTreeClose")
        if is_no_file or is_dir then
            vim.cmd("Startup display")
            vim.cmd("NvimTreeToggle")
        else
            vim.cmd("NvimTreeToggle")
        end
        vim.cmd("wincmd l")
    end,
})


vim.api.nvim_create_autocmd("TabLeave", {
    callback = function ()
        vim.cmd("wincmd l")
    end,
})

-- Hack to Open filetree on newtab 
vim.api.nvim_create_autocmd("TabNewEntered", {
    callback = function ()
        vim.cmd("NvimTreeClose")
        vim.cmd("NvimTreeToggle")
        vim.cmd("wincmd l")
    end,
})


-- Quit if filetree last buffer... Dangerous but worth it?
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_tabpage_list_wins(0) == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd("q")
        end
  end
})
