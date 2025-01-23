return {
  {
    "azratul/live-share.nvim",
    dependencies = {
      "jbyuki/instant.nvim",
    },
    config = function()
      vim.g.instant_username = "USER"
      require("live-share").setup({
        port_internal = 4080,
      })
    end
  }
}
