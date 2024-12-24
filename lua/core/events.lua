-- lua scrips that should happen on event ie bufWinLeave

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('custom', { clear = true }),
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})


vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup('custom-enter', { clear = true }),
  desc = 'run when entering vim',
  callback = function()
    require("core.utils").release_empty_unnamed_buffers();
  end,
})
