local cfg = {
  floating_window = false,
  hint_prefix = "» ",
  hint_scheme = "String",
  hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },
  toggle_key = '<C-s>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = '<C-d>', -- cycle to next signature, e.g. '<M-n>' function overloading
}
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

