require("stickybuf").setup({
  get_auto_pin = function(bufnr)
    local buftype = vim.bo[bufnr].buftype

    -- Check if the buffer is a toggleterm buffer
    if buftype == "terminal" and vim.fn.exists(":ToggleTerm") == 2 then
    return "toggleterm"
    end

    return require("stickybuf").should_auto_pin(bufnr)
  end
})

