require("ijcc")

function CLOSE_TERMINAL()
    if vim.bo.buftype == 'terminal' then
        vim.cmd(':startinsert')
        vim.api.nvim_input('<C-d>')
    end
end

